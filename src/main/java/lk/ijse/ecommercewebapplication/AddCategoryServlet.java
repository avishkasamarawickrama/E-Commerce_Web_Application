package lk.ijse.ecommercewebapplication;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.*;

public class AddCategoryServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the add_category.jsp page to show the form
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_category.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve category name and description from the form
        String categoryName = request.getParameter("name");
        String description = request.getParameter("description");

        // Validate input (basic validation for demo purposes)
        if (categoryName == null || categoryName.isEmpty() || description == null || description.isEmpty()) {
            request.setAttribute("errorMessage", "Category name and description are required!");
            request.getRequestDispatcher("add_category.jsp").forward(request, response);
            return;
        }

        // Database connection setup
        try (Connection connection = ConnectionPool.getDataSource().getConnection()) {
            // SQL query to insert a new category
            String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, categoryName);
            stmt.setString(2, description);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // If category is added successfully, redirect to manage_categories.jsp
            if (rowsAffected > 0) {
                response.sendRedirect("manage_categories.jsp");
            } else {
                // If something went wrong, show error message
                request.setAttribute("errorMessage", "Failed to add category!");
                request.getRequestDispatcher("add_category.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("add_category.jsp").forward(request, response);
        }
    }
}
