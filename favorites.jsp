<%@ page import="java.util.*, java.util.Map" %>
<%
    List<Map<String, String>> favorites = (List<Map<String, String>>) request.getAttribute("favorites");
    if (favorites == null) favorites = new ArrayList<>();
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
