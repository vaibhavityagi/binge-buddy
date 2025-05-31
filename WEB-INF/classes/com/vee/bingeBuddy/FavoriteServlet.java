package com.vee.bingeBuddy;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

public class FavoriteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    String showId = request.getParameter("showId");
    String showName = request.getParameter("showName");
    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
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
            if ("add".equals(action)) {
                // check duplicate
                PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM favorites WHERE user_id = ? AND show_id = ?");
                checkStmt.setInt(1, userId);
                checkStmt.setString(2, showId);
                ResultSet rsCheck = checkStmt.executeQuery();
                if (!rsCheck.next()) {
                    PreparedStatement ps = conn.prepareStatement("INSERT INTO favorites (user_id, show_id, show_name) VALUES (?, ?, ?)");
                    ps.setInt(1, userId);
                    ps.setString(2, showId);
                    ps.setString(3, showName);
                    ps.executeUpdate();
                }
            } else if ("remove".equals(action)) {
                PreparedStatement ps = conn.prepareStatement("DELETE FROM favorites WHERE user_id = ? AND show_id = ?");
                ps.setInt(1, userId);
                ps.setString(2, showId);
                ps.executeUpdate();
            }
        }
        response.sendRedirect("favorites.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
}

}    