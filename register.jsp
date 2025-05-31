<%@ page session="true" %> <%@ page contentType="text/html;charset=UTF-8"
language="java" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Register</title>
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
      <h2>Register</h2>
      <form method="post" action="register">
        <input type="text" name="username" placeholder="Username" required />
        <input
          type="password"
          name="password"
          placeholder="Password"
          required
        />
        <input type="submit" value="Register" class="btn" />
        <a href="login.jsp">Already have an account? Login</a>
      </form>
      <div style="margin-top: 1rem; text-align: center">
        <%= request.getAttribute("msg") != null ? request.getAttribute("msg") :
        "" %>
      </div>
    </div>
  </body>
</html>

