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

        if (username == null || query == null || query.trim().isEmpty()) {
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement uidStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            uidStmt.setString(1, username);
            ResultSet rs = uidStmt.executeQuery();
            int userId = -1;
            if (rs.next()) {
                userId = rs.getInt("id");
            }
            if (userId != -1) {
                PreparedStatement ps = conn
                        .prepareStatement("INSERT INTO searches (user_id, query, timestamp) VALUES (?, ?, NOW())");
                ps.setInt(1, userId);
                ps.setString(2, query.trim());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
