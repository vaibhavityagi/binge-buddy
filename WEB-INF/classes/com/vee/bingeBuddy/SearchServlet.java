package com.vee.bingeBuddy;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String query = request.getParameter("query");

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement uidStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            uidStmt.setString(1, username);
            ResultSet rs = uidStmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");

                PreparedStatement ps = conn
                        .prepareStatement("INSERT INTO search_history (user_id, query) VALUES (?, ?)");
                ps.setInt(1, userId);
                ps.setString(2, query);
                ps.executeUpdate();
            }

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=search");
        }
    }
}
