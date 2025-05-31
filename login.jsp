<%@ page session="true" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
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
      .form-container {
        width: 100%;
        max-width: 400px;
        margin: var(--space-8) auto;
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(20px);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-lg);
        padding: var(--space-8);
        animation: fadeInScale 0.7s;
      }
    </style>
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
        <input type="submit" value="Login" class="btn" />
      </form>

      <% String msg = (String) request.getAttribute("msg"); if (msg != null) {
      %>
      <p style="color: red; text-align: center"><%= msg %></p>
      <% } %>

      <a href="register.jsp">Don't have an account? Register</a>
    </div>
  </body>
</html>

