<%@ page session="true" %> <% String user = (String)
session.getAttribute("username"); if (user == null) {
response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TV Show Search</title>
    <link rel="stylesheet" href="styles.css" />
  </head>

  <body>
    <h1>Welcome, <%= user %>! Find your favourite TV shows</h1>
    <header>
      <input type="text" placeholder="tv show" id="searchBar" />
      <button>Submit</button>
    </header>
    <div class="container"></div>

    <br />
    <a href="profile.jsp">My Profile</a>
    <a href="favorites.jsp">My Favourites</a>
    <a href="logout.jsp" style="color: white">Logout</a>

    <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
    <script src="search.js"></script>
  </body>
</html>

