package com.vee.bingeBuddy;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class UserProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Get user ID
            PreparedStatement userStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            userStmt.setString(1, username);
            ResultSet rs = userStmt.executeQuery();
            int userId = -1;
            if (rs.next()) {
                userId = rs.getInt("id");
            }

            int favCount = 0;
            if (userId != -1) {
                PreparedStatement countStmt = conn
                        .prepareStatement("SELECT COUNT(*) AS count FROM favorites WHERE user_id = ?");
                countStmt.setInt(1, userId);
                ResultSet countRs = countStmt.executeQuery();
                if (countRs.next()) {
                    favCount = countRs.getInt("count");
                }
            }

            request.setAttribute("username", username);
            request.setAttribute("favCount", favCount);
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
