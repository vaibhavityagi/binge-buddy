package com.vee.bingeBuddy;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Get user ID
            PreparedStatement uidStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            uidStmt.setString(1, username);
            ResultSet rs = uidStmt.executeQuery();
            int userId = -1;
            if (rs.next()) {
                userId = rs.getInt("id");
            }

            // Get recent searches
            List<String> recentSearches = new ArrayList<>();

            PreparedStatement searchStmt = conn.prepareStatement(
                    "SELECT query FROM searches WHERE user_id = ? ORDER BY timestamp DESC LIMIT 5");
            searchStmt.setInt(1, userId);
            ResultSet searchRs = searchStmt.executeQuery();

            while (searchRs.next()) {
                recentSearches.add(searchRs.getString("query"));
            }

            request.setAttribute("recentSearches", recentSearches);

            // Get favorite count
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
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
