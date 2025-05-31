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
    <style>
      .main-content {
        width: 100%;
        max-width: 800px;
        margin: var(--space-8) auto;
        padding: var(--space-8);
        animation: fadeInScale 0.7s;
        color: var(--text-primary);
      }
      .container {
        width: 100%;
        max-width: 800px;
        margin: var(--space-8) auto;
      }
    </style>
  </head>

  <body>
    <nav class="navbar">
      <div class="nav-left">Binge Buddy</div>
      <div class="nav-links">
        <a href="profile" class="btn">My Profile</a>
        <a href="favorites" class="btn">My Favourites</a>
        <a href="logout.jsp" class="btn">Logout</a>
      </div>
    </nav>
    <div class="main-content">
      <h1>Welcome, <%= user %>! Find your favourite TV shows</h1>
      <header>
        <form
          id="searchForm"
          style="display: flex; gap: var(--space-3); width: 100%"
        >
          <input type="text" placeholder="Search TV show..." id="searchBar" />
          <button type="submit" class="btn" id="searchBtn">Search</button>
        </form>
      </header>
      <div class="container"></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
    <script src="search.js"></script>
  </body>
</html>

