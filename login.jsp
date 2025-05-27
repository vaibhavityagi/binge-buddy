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

<html>
<head><title>Login</title></head>
<body>
    <h2>Login</h2>
    <form method="post">
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <button type="submit">Login</button>
    </form>
    <p style="color:red;"><%= msg %></p>
</body>
</html>