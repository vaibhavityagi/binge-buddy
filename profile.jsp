<%@ page session="true" %> <%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>User Profile</title>
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body>
    <div class="profile-container">
      <h2>Welcome, <%= request.getAttribute("username") %>!</h2>
      <p>
        <strong>Total Favourite Shows:</strong> <%=
        request.getAttribute("favCount") %>
      </p>
      <a href="favorites.jsp">View My Favourites</a><br />
      <a href="logout.jsp">Logout</a>
    </div>
  </body>
</html>
