<%@ page session="true" %> <% String user = (String)
session.getAttribute("username"); if (user != null) {
response.sendRedirect("search.jsp"); return; } %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Welcome to BingeBuddy</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
      body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        margin: 0;
      }
    </style>
  </head>
  <body>
    <div class="welcome-container">
      <h1>Welcome to BingeBuddy</h1>
      <p>Please login or register to continue</p>
      <div class="btn-group">
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn">Register</a>
      </div>
    </div>
  </body>
</html>
