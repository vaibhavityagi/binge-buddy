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
      body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        margin: 0;
        padding: var(--space-4);
      }
      .fav-list {
        width: 100%;
        max-width: 800px;
        margin: var(--space-8) auto;
      }
      .fav-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(20px);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-lg);
        padding: var(--space-6);
        margin-bottom: var(--space-4);
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: all var(--transition-normal);
      }
      .fav-card:hover {
        transform: translateY(-4px);
        box-shadow: var(--shadow-xl);
      }
      .fav-info {
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--text-primary);
      }
      .fav-btn {
        background: linear-gradient(135deg, var(--danger-color), #e53e3e);
        color: var(--text-on-dark);
        border: none;
        padding: var(--space-3) var(--space-6);
        border-radius: var(--radius-md);
        cursor: pointer;
        transition: all var(--transition-normal);
      }
      .fav-btn:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
      }
    </style>
</head>
<body>
    <nav class="navbar">
      <div class="nav-left">Binge Buddy</div>
      <div class="nav-links">
        <a href="search.jsp" class="btn">Search</a>
        <a href="profile.jsp" class="btn">Profile</a>
        <a href="logout.jsp" class="btn">Logout</a>
      </div>
    </nav>

    <h1 style="text-align:center; margin-top: 2rem; color: var(--text-primary);">Your Favorite TV Shows</h1>

    <div class="fav-list">
        <% if (favorites.isEmpty()) { %>
            <p style="text-align:center; color: var(--text-primary);">You have no favorite shows yet. Search and add some!</p>
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
</body>
</html>
