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

        if (users.containsKey(username)) {
            msg = "<span style='color: red;'>Username already exists!</span>";
        } else {
            users.put(username, password);
            msg = "<span style='color: green;'>Registered successfully! Please <a href='login.jsp'>login</a>.</span>";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="form-container">
    <h2>Register</h2>
    <form method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="submit" value="Register" />
        <a href="login.jsp">Already have an account? Login</a>
    </form>
    <div style="margin-top: 1rem; text-align: center;"><%= msg %></div>
</div>
</body>
</html>
