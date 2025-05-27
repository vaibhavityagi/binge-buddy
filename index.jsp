<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    if (user != null) {
        response.sendRedirect("search.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Welcome to TV Show Search</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: black;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
        }
        a {
            color: white;
            text-decoration: none;
            margin: 1em;
            padding: 0.5em 1em;
            border: 2px solid white;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
    <h1>Welcome to TV Show Search</h1>
    <p>Please login or register to continue:</p>
    <div>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>
</body>
</html>