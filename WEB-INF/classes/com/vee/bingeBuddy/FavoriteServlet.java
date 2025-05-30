import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.vee.bingeBuddy.DatabaseConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class FavoriteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String showId = request.getParameter("showId");
        String showName = request.getParameter("showName");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("userEmail");

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement uidStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            uidStmt.setString(1, username);
            ResultSet rs = uidStmt.executeQuery();
            int userId = -1;
            if (rs.next()) {
                userId = rs.getInt("id");
            }
            if (userId != -1) {
                if ("add".equals(action)) {
                    PreparedStatement ps = conn.prepareStatement("INSERT INTO favorites (user_id, show_id, show_name) VALUES (?, ?, ?)");
                    ps.setInt(1, userId);
                    ps.setString(2, showId);
                    ps.setString(3, showName);
                    ps.executeUpdate();
                } else if ("remove".equals(action)) {
                    PreparedStatement ps = conn.prepareStatement("DELETE FROM favorites WHERE user_id = ? AND show_id = ?");
                    ps.setInt(1, userId);
                    ps.setString(2, showId);
                    ps.executeUpdate();
                }
            }
            response.sendRedirect("favorites.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}