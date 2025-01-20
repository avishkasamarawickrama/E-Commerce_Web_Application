<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container my-5">
    <h2 class="text-center mb-4">Order Details</h2>

    <%
        int orderId = 0;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid order ID.");
        }

        if (orderId > 0) {
            Connection conn = null;
            PreparedStatement orderStmt = null;
            PreparedStatement itemsStmt = null;
            ResultSet orderRs = null;
            ResultSet itemsRs = null;

            try {
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/ecommerce";
                String dbUser = "root";
                String dbPassword = "Ijse@123";

                // Establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Query to fetch order details
                String orderQuery = "SELECT o.id, o.total_amount, o.status, o.order_date, u.name AS customerName, u.email " +
                        "FROM orders o JOIN users u ON o.user_id = u.id WHERE o.id = ?";
                orderStmt = conn.prepareStatement(orderQuery);
                orderStmt.setInt(1, orderId);
                orderRs = orderStmt.executeQuery();

                // Store order details in request attributes
                if (orderRs.next()) {
                    request.setAttribute("orderDetails", orderRs);
                } else {
                    request.setAttribute("errorMessage", "Order not found.");
                }

                // Query to fetch order items
                String itemsQuery = "SELECT p.name AS productName, oi.quantity, oi.price, (oi.quantity * oi.price) AS subtotal " +
                        "FROM order_items oi JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?";
                itemsStmt = conn.prepareStatement(itemsQuery);
                itemsStmt.setInt(1, orderId);
                itemsRs = itemsStmt.executeQuery();

                // Store order items in request attributes
                List<Map<String, Object>> items = new ArrayList<>();
                while (itemsRs.next()) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("productName", itemsRs.getString("productName"));
                    item.put("quantity", itemsRs.getInt("quantity"));
                    item.put("price", itemsRs.getDouble("price"));
                    item.put("subtotal", itemsRs.getDouble("subtotal"));
                    items.add(item);
                }
                request.setAttribute("orderItems", items);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while fetching order details.");
            } finally {
                // Close resources
                if (itemsRs != null) try { itemsRs.close(); } catch (SQLException ignored) {}
                if (orderRs != null) try { orderRs.close(); } catch (SQLException ignored) {}
                if (itemsStmt != null) try { itemsStmt.close(); } catch (SQLException ignored) {}
                if (orderStmt != null) try { orderStmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        }
    %>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger text-center">
                ${errorMessage}
        </div>
    </c:if>

    <c:if test="${not empty orderDetails}">
        <div class="card mb-4">
            <div class="card-header">
                Order ID: <c:out value="${orderDetails.id}" />
            </div>
            <div class="card-body">
                <h5 class="card-title">Customer: <c:out value="${orderDetails.customerName}" /></h5>
                <p>Email: <c:out value="${orderDetails.email}" /></p>
                <p>Order Date: <c:out value="${orderDetails.order_date}" /></p>
                <p>Status: <c:out value="${orderDetails.status}" /></p>
                <p>Total Amount: $<c:out value="${orderDetails.total_amount}" /></p>
            </div>
        </div>

        <h4>Order Items</h4>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Subtotal</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${orderItems}">
                <tr>
                    <td><c:out value="${item.productName}" /></td>
                    <td><c:out value="${item.quantity}" /></td>
                    <td>$<c:out value="${item.price}" /></td>
                    <td>$<c:out value="${item.subtotal}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
