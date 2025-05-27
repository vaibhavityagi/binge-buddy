Connection conn = DBUtil.getConnection();
PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
ps.setString(1, request.getParameter("username"));
ps.setString(2, request.getParameter("password"));
ResultSet rs = ps.executeQuery();
if (rs.next()) {
    session.setAttribute("username", rs.getString("username"));
}