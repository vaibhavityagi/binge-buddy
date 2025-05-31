package com.vee.bingeBuddy;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Check if username already exists
            PreparedStatement checkStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("msg", "<span style='color:red;'>Username already exists!</span>");
            } else {
                PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
                insertStmt.setString(1, username);
                insertStmt.setString(2, password);
                insertStmt.executeUpdate();
                request.setAttribute("msg", "<span style='color:green;'>Registered successfully! Please <a href='login.jsp'>login</a>.</span>");
            }
        } catch (Exception e) {
            request.setAttribute("msg", "<span style='color:red;'>Something went wrong!</span>");
            e.printStackTrace();
        }

        // Forward back to the form
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}