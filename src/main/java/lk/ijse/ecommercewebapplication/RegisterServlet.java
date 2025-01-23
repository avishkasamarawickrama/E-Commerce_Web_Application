package lk.ijse.ecommercewebapplication;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplication.DTO.UserDTO;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String role = req.getParameter("role");


            if (username == null || username.isEmpty() || email == null || email.isEmpty() ||
                    password == null || password.isEmpty() || role == null || role.isEmpty()) {
                req.getSession().setAttribute("message", "All fields are required.");
                req.getSession().setAttribute("alertType", "danger");
                resp.sendRedirect("registration.jsp");
                return;
            }

            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            UserDTO userDTO = new UserDTO();
            userDTO.setUsername(username);
            userDTO.setEmail(email);
            userDTO.setPassword(hashedPassword);
            userDTO.setRole(role);


            boolean isRegistered = registerUser(userDTO);

            if (isRegistered) {
                req.getSession().setAttribute("message", "Registration successful. Please log in.");
                req.getSession().setAttribute("alertType", "success");
                resp.sendRedirect("index.jsp");
            } else {
                req.getSession().setAttribute("message", "Registration failed. Please try again.");
                req.getSession().setAttribute("alertType", "danger");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("message", "An error occurred: " + e.getMessage());
            req.getSession().setAttribute("alertType", "danger");
            resp.sendRedirect("register.jsp");
        }
    }

    private boolean registerUser(UserDTO userDTO) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO users (userName, email, password, role, status) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, userDTO.getUsername());
                statement.setString(2, userDTO.getEmail());
                statement.setString(3, userDTO.getPassword());
                statement.setString(4, userDTO.getRole());


                return statement.executeUpdate() > 0;
            }
        }
    }
}