<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
session="true" %> <%@ page import="java.util.List" %> <% String user = (String)
session.getAttribute("username"); if (user == null) {
response.sendRedirect("login.jsp"); return; } List<String>
  recentSearches = (List<String
    >) request.getAttribute("recentSearches"); %>

    <!DOCTYPE html>
    <html>
      <head>
        <title>Your Profile</title>
        <link rel="stylesheet" href="styles.css" />
      </head>
      <body>
        <nav class="navbar">
          <div class="nav-left">Binge Buddy</div>
          <div class="nav-links">
            <a href="search.jsp" class="btn">Search</a>
            <a href="favorites" class="btn">Favourites</a>
            <a href="logout.jsp" class="btn">Logout</a>
          </div>
        </nav>

        <div class="profile-container">
          <h2>Welcome, <%= user %></h2>

          <h3>Recent Searches</h3>
          <ul>
            <% if (recentSearches != null && !recentSearches.isEmpty()) { for
            (String search : recentSearches) { %>
            <li><%= search %></li>
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
