<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
session="true" %> <%@ page import="java.util.List" %> <% String user = (String)
session.getAttribute("username"); if (user == null) {
response.sendRedirect("login.jsp"); return; } List<String>
  searchHistory = (List<String
    >) request.getAttribute("searchHistory"); %>

    <!DOCTYPE html>
    <html>
      <head>
        <title>Your Profile</title>
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
          .profile-container {
            width: 100%;
            max-width: 800px;
            margin: var(--space-8) auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            padding: var(--space-8);
            animation: fadeInScale 0.7s;
            color: var(--text-primary);
          }
        </style>
      </head>
      <body>
        <nav class="navbar">
          <div class="nav-left">Binge Buddy</div>
          <div class="nav-links">
            <a href="favorites.jsp" class="btn">Favourites</a>
            <a href="search.jsp" class="btn">Search</a>
            <a href="logout.jsp" class="btn">Logout</a>
          </div>
        </nav>
        <div class="profile-container">
          <h2>Welcome, <%= user %></h2>

          <h3>Your Recent Searches:</h3>
          <ul>
            <% if (searchHistory != null && !searchHistory.isEmpty()) { for
            (String q : searchHistory) { %>
            <li><%= q %></li>
            <% } } else { %>
            <li>No recent searches found.</li>
            <% } %>
          </ul>

          <p>
            <strong>Total Favourite Shows:</strong> <%=
            request.getAttribute("favCount") %>
          </p>
        </div>
      </body>
    </html>
  </String></String
>
