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
    <title>Welcome to BingeBuddy</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        body {
            background: linear-gradient(to right, #2c3e50, #3498db);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .welcome-container {
            background-color: white;
            padding: 3rem 3.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            text-align: center;
            animation: fadeIn 0.8s ease-out;
        }

        .welcome-container h1 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .welcome-container p {
            margin-bottom: 2rem;
            font-size: 1rem;
            color: #444;
        }

        .welcome-container a {
            text-decoration: none;
            margin: 0 0.5rem;
            padding: 0.7rem 1.5rem;
            border: none;
            border-radius: 5px;
            background-color: #3498db;
            color: white;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .welcome-container a:hover {
            background-color: #2980b9;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
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
