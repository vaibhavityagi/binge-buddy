<%@ page session="true" %> <%@ page contentType="text/html;charset=UTF-8"
language="java" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Register</title>
    <link rel="stylesheet" href="styles.css" />
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
        <input type="submit" value="Register" />
        <a href="login.jsp">Already have an account? Login</a>
      </form>
      <div style="margin-top: 1rem; text-align: center">
        <%= request.getAttribute("msg") != null ? request.getAttribute("msg") :
        "" %>
      </div>
    </div>
  </body>
</html>

