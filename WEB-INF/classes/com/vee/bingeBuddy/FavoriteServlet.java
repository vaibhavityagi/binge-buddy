package com.vee.bingeBuddy;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        response.sendRedirect("favorites");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
}

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // Get favorites
        List<Map<String, String>> favorites = new ArrayList<>();
        if (userId != -1) {
            PreparedStatement ps = conn.prepareStatement("SELECT show_id, show_name FROM favorites WHERE user_id = ?");
            ps.setInt(1, userId);
            ResultSet favRs = ps.executeQuery();
            while (favRs.next()) {
                Map<String, String> fav = new HashMap<>();
                fav.put("showId", favRs.getString("show_id"));
                fav.put("showName", favRs.getString("show_name"));
                favorites.add(fav);
            }
        }

        request.setAttribute("favorites", favorites);
        request.setAttribute("mssg", "Successfully added to your favorites!");
        request.getRequestDispatcher("search.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
}

}    