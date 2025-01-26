package lk.ijse.ecommercewebapplication;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;



    @WebServlet("/login")
    public class LoginServlet extends HttpServlet {

        @Resource(name = "java:comp/env/jdbc/pool")
        private DataSource dataSource;
        private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
        private static final String DB_USER = "root";
        private static final String DB_PASSWORD = "password";

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "SELECT * FROM users WHERE username = ?";
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, username);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String storedPasswordHash = rs.getString("password_hash");
                    String role = rs.getString("role");

                    // Verify the password using bcrypt
                    if (BCrypt.checkpw(password, storedPasswordHash)) {
                        // Successful login
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        session.setAttribute("role", role);
                        response.sendRedirect("index.jsp");
                        return;
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // If login fails
            response.sendRedirect("error.jsp");
        }
    }