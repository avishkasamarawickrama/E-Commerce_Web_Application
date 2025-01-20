<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="java.util.*, com.example.ecommerce.model.Order, com.example.ecommerce.dao.OrderDAO" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Orders</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp" />

<!-- Header -->
<header>
    <h1>Order Management</h1>
    <nav>
        <a href="admin_dashboard.jsp">Dashboard</a> |
        <a href="manage_products.jsp">Manage Products</a> |
        <a href="manage_categories.jsp">Manage Categories</a> |
        <a href="manage_users.jsp">Manage Users</a> |
        <a href="logout.jsp">Logout</a>
    </nav>
</header>

<!-- Main Content -->
<main>
    <section>
        <h2>Order List</h2>
        <table>
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Loop through the orders and display them -->
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td><c:out value="${order.id}" /></td>
                    <td><c:out value="${order.customerName}" /></td>
                    <td><c:out value="${order.totalPrice}" /></td>
                    <td><c:out value="${order.status}" /></td>
                    <td>
                        <!-- View link -->
                        <a href="view_order.jsp?orderId=${order.id}">View</a> |
                        <!-- Change status link -->
                        <a href="change_order_status.jsp?orderId=${order.id}&status=shipped">Ship</a> |
                        <a href="change_order_status.jsp?orderId=${order.id}&status=delivered">Deliver</a> |
                        <!-- Cancel order link -->
                        <a href="cancel_order.jsp?orderId=${order.id}" onclick="return confirm('Are you sure you want to cancel this order?')">Cancel</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
