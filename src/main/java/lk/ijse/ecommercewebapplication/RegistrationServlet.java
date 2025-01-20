package lk.ijse.ecommercewebapplication;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplication.Model.User;
import lk.ijse.ecommercewebapplication.Util.DBUtil;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user input from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check if the passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match. Please try again.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Check if the user already exists
        if (DBUtil.isUserExists(email)) {
            request.setAttribute("errorMessage", "An account with this email already exists.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Hash the password before saving to the database
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Create a new user and save it to the database
        User user = new User(name, email, hashedPassword);
        boolean isRegistered = DBUtil.registerUser(user);

        if (isRegistered) {
            // If registration is successful, redirect to the login page
            response.sendRedirect("login.jsp");
        } else {
            // If registration failed, show an error
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}