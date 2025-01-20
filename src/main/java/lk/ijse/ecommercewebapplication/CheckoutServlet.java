package lk.ijse.ecommercewebapplication;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "checkout", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        try (Connection connection = ConnectionPool.getDataSource().getConnection()) {
            String sql = "INSERT INTO orders (user_id, total) SELECT ?, SUM(p.price * c.quantity) " +
                    "FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, userId);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                int orderId = rs.getInt(1);
                // Move cart items to order_details
                String detailsSql = "INSERT INTO order_details (order_id, product_id, quantity, price) " +
                        "SELECT ?, product_id, quantity, price FROM cart WHERE user_id = ?";
                PreparedStatement detailsStmt = connection.prepareStatement(detailsSql);
                detailsStmt.setInt(1, orderId);
                detailsStmt.setInt(2, userId);
                detailsStmt.executeUpdate();
                // Clear cart
                String clearCartSql = "DELETE FROM cart WHERE user_id = ?";
                PreparedStatement clearCartStmt = connection.prepareStatement(clearCartSql);
                clearCartStmt.setInt(1, userId);
                clearCartStmt.executeUpdate();
                response.sendRedirect("order_confirmation.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
