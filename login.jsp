<%@ page session="true" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
  </head>
  <body>
    <div class="form-container">
      <h2>Login</h2>
      <form method="post" action="login">
        <input
          type="text"
          name="username"
          placeholder="Username"
          required
        /><br />
        <input
          type="password"
          name="password"
          placeholder="Password"
          required
        /><br />
        <input type="submit" value="Login" />
      </form>

      <% String msg = (String) request.getAttribute("msg"); if (msg != null) {
      %>
      <p style="color: red; text-align: center"><%= msg %></p>
      <% } %>

      <a href="register.jsp">Don't have an account? Register</a>
    </div>
  </body>
</html>

