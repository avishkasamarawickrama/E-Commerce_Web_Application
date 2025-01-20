<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="java.util.*, com.example.ecommerce.model.Order, com.example.ecommerce.model.Product, com.example.ecommerce.dao.OrderDAO, com.example.ecommerce.dao.ProductDAO" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp" />

<header>
    <h1>Welcome, Admin</h1>
    <nav>
        <a href="admin_dashboard.jsp">Dashboard</a> |
        <a href="manage_products.jsp">Manage Products</a> |
        <a href="manage_orders.jsp">Manage Orders</a> |
        <a href="manage_users.jsp">Manage Users</a> |
        <a href="logout.jsp">Logout</a>
    </nav>
</header>


<aside>
    <h3>Admin Controls</h3>
    <ul>
        <li><a href="manage_products.jsp">Manage Products</a></li>
        <li><a href="manage_orders.jsp">Manage Orders</a></li>
        <li><a href="manage_users.jsp">Manage Users</a></li>
        <li><a href="add_product.jsp">Add New Product</a></li>
        <li><a href="generate_reports.jsp">Generate Reports</a></li>
    </ul>
</aside>


<main>
    <section>
        <h2>Overview</h2>
        <div class="stats">

            <div class="stat-item">
                <h3>Products</h3>
                <p>Total Products: <c:out value="${ProductDAO.getTotalProducts()}" /></p>
            </div>


            <div class="stat-item">
                <h3>Orders</h3>
                <p>Total Orders: <c:out value="${OrderDAO.getTotalOrders()}" /></p>
            </div>


            <div class="stat-item">
                <h3>Users</h3>
                <p>Total Users: <c:out value="${UserDAO.getTotalUsers()}" /></p>
            </div>
        </div>
    </section>

    <section>
        <h2>Recent Orders</h2>
        <table>
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Order Total</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${OrderDAO.getRecentOrders()}" varStatus="status">
                <tr>
                    <td><c:out value="${order.id}" /></td>
                    <td><c:out value="${order.customerName}" /></td>
                    <td><c:out value="${order.total}" /></td>
                    <td><c:out value="${order.status}" /></td>
                    <td><a href="view_order.jsp?orderId=${order.id}">View</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>

    <section>
        <h2>Recent Products</h2>
        <table>
            <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${ProductDAO.getRecentProducts()}" varStatus="status">
                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.price}" /></td>
                    <td><c:out value="${product.stock}" /></td>
                    <td><a href="edit_product.jsp?productId=${product.id}">Edit</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</main>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<jsp:include page="footer.jsp" />

</body>
</html>

