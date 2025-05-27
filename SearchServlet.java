PreparedStatement ps = conn.prepareStatement("INSERT INTO search_history (user_id, query) VALUES (?, ?)");
ps.setInt(1, userId);
ps.setString(2, request.getParameter("query"));
ps.executeUpdate();
