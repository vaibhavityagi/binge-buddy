<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    Map<String, String> users = (Map<String, String>) application.getAttribute("users");
    if (users == null) {
        users = new HashMap<>();
        application.setAttribute("users", users);
    }

    String msg = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (users.containsKey(username) && users.get(username).equals(password)) {
            session.setAttribute("username", username);
            response.sendRedirect("search.jsp");
            return;
        } else {
            msg = "Invalid credentials.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Login</h2>
        <form method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">
        </form>
        <% if (!msg.isEmpty()) { %>
            <p style="color:red; text-align: center;"><%= msg %></p>
        <% } %>
        <a href="register.jsp">Don't have an account? Register</a>
    </div>
</body>
</html>
