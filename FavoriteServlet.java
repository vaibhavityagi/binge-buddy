String action = request.getParameter("action");
String username = (String) session.getAttribute("username");

Connection conn = DBUtil.getConnection();
PreparedStatement psUser = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
psUser.setString(1, username);
ResultSet rsUser = psUser.executeQuery();
rsUser.next();
int userId = rsUser.getInt("id");

if ("add".equals(action)) {
    PreparedStatement ps = conn.prepareStatement("INSERT INTO favorites (user_id, show_id, show_name) VALUES (?, ?, ?)");
    ps.setInt(1, userId);
    ps.setString(2, request.getParameter("showId"));
    ps.setString(3, request.getParameter("showName"));
    ps.executeUpdate();
}
