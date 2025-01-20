<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="java.util.*, com.example.ecommerce.model.Product, com.example.ecommerce.dao.ProductDAO" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp" />

<!-- Header -->
<header>
    <h1>Product Management</h1>
    <nav>
        <a href="admin_dashboard.jsp">Dashboard</a> |
        <a href="manage_orders.jsp">Manage Orders</a> |
        <a href="manage_users.jsp">Manage Users</a> |
        <a href="add_product.jsp">Add New Product</a> |
        <a href="logout.jsp">Logout</a>
    </nav>
</header>

<!-- Main Content -->
<main>
    <section>
        <h2>Product List</h2>
        <table>
            <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Loop through the products and display them -->
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.category}" /></td>
                    <td><c:out value="${product.price}" /></td>
                    <td><c:out value="${product.stock}" /></td>
                    <td>
                        <!-- Edit link -->
                        <a href="edit_product.jsp?productId=${product.id}">Edit</a> |
                        <!-- Delete link -->
                        <a href="delete_product.jsp?productId=${product.id}" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
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

