<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%
    String user = (String) session.getAttribute("userEmail");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<String> searchHistory = (List<String>) request.getAttribute("searchHistory");
%>

    <!DOCTYPE html>
    <html>
      <head>
        <title>Your Profile</title>
        <link rel="stylesheet" href="styles.css" />
      </head>
      <body>
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
          <a href="favorites.jsp">View My Favourites</a><br />
          <a href="search.jsp">Back to Search</a>
          <a href="logout.jsp">Logout</a>
        </div>
      </body>
    </html>
  
