<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.vee.bingeBuddy.DatabaseConnection" %>
<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get userId from database
    int userId = -1;
    List<Map<String, String>> favorites = new ArrayList<>();

    try (Connection conn = DatabaseConnection.getConnection()) {
        // Get user id
        PreparedStatement userStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
        userStmt.setString(1, user);
        ResultSet rsUser = userStmt.executeQuery();
        if (rsUser.next()) {
            userId = rsUser.getInt("id");
        }

        if (userId != -1) {
            // Get favorites for user
            PreparedStatement favStmt = conn.prepareStatement("SELECT show_id, show_name FROM favorites WHERE user_id = ?");
            favStmt.setInt(1, userId);
            ResultSet rsFav = favStmt.executeQuery();

            while (rsFav.next()) {
                Map<String, String> fav = new HashMap<>();
                fav.put("showId", rsFav.getString("show_id"));
                fav.put("showName", rsFav.getString("show_name"));
                favorites.add(fav);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Your Favorites - TV Show Search</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
       
    </style>
</head>
<body>

    <h1 style="text-align:center; margin-top: 2rem;">Your Favorite TV Shows</h1>

    <div class="fav-list">
        <% if (favorites.isEmpty()) { %>
            <p style="text-align:center; color: white;">You have no favorite shows yet. Search and add some!</p>
        <% } else { 
            for (Map<String, String> fav : favorites) { %>
                <div class="fav-card">
                    <div class="fav-info"><%= fav.get("showName") %></div>
                    <form method="post" action="favorites">
                        <input type="hidden" name="action" value="remove" />
                        <input type="hidden" name="showId" value="<%= fav.get("showId") %>" />
                        <button class="fav-btn" type="submit">Remove</button>
                    </form>
                </div>
        <%  } } %>
    </div>

    <a href="search.jsp" style="display:block; text-align:center; margin-bottom: 2rem; color: white; font-weight: 600;">Back to Search</a>
    <a href="logout.jsp" class="logout-link">Logout</a>

</body>
</html>
