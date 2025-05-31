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
      .navbar {
        width: 100%;
        background: linear-gradient(
          90deg,
          var(--primary-color),
          var(--secondary-color)
        );
        color: var(--text-on-dark);
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: var(--space-3) var(--space-8);
        box-shadow: var(--shadow-md);
        position: sticky;
        top: 0;
        z-index: 100;
      }
      .navbar .nav-left {
        font-size: 1.5rem;
        font-weight: bold;
        letter-spacing: 1px;
      }
      .navbar .nav-links {
        display: flex;
        gap: var(--space-6);
      }
      .navbar .nav-links a {
        color: var(--text-on-dark);
        text-decoration: none;
        font-weight: 500;
        transition: color var(--transition-fast);
        padding: var(--space-2) var(--space-3);
        border-radius: var(--radius-sm);
      }
      .navbar .nav-links a:hover {
        background: var(--accent-color);
        color: var(--primary-dark);
      }
      .main-content {
        max-width: 800px;
        margin: 2rem auto;
        background: var(--bg-primary);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-lg);
        padding: var(--space-8);
        animation: fadeInScale 0.7s;
      }
      @media (max-width: 600px) {
        .main-content {
          padding: var(--space-4);
        }
        .navbar {
          flex-direction: column;
          align-items: flex-start;
          gap: var(--space-2);
        }
        .navbar .nav-links {
          gap: var(--space-3);
        }
      }
    </style>
  </head>

  <body>
    <nav class="navbar">
      <div class="nav-left">TVShowFinder</div>
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
          <button type="submit" class="btn">Search</button>
        </form>
      </header>
      <div class="container"></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
    <script src="search.js"></script>
  </body>
</html>

