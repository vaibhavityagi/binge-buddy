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
  </head>
  <body>
    <div class="welcome-container">
      <h1>Welcome to BingeBuddy</h1>
      <p>Please login or register to continue</p>
      <a href="login.jsp">Login</a>
      <a href="register.jsp">Register</a>
    </div>
  </body>
</html>

