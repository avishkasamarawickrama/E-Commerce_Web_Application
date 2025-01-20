<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@page import="java.util.*, com.example.ecommerce.model.Order, com.example.ecommerce.model.Product" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp" />

<header>
    <h1>Order Confirmation</h1>
    <nav>
        <a href="home.jsp">Home</a> |
        <a href="orders.jsp">My Orders</a> |
        <a href="profile.jsp">Profile</a>
    </nav>
</header>

<main>
    <h2>Thank You for Your Order!</h2>
    <p>Your order has been successfully placed. Below is your order summary:</p>

    <!-- Order Number and Date -->
    <div>
        <h3>Order Number: ${order.orderNumber}</h3>
        <p>Order Date: ${order.orderDate}</p>
    </div>

    <!-- Shipping Information -->
    <div>
        <h3>Shipping Information</h3>
        <p><strong>Address:</strong> ${order.shippingAddress}</p>
        <p><strong>City:</strong> ${order.shippingCity}</p>
        <p><strong>Zip Code:</strong> ${order.shippingZipCode}</p>
        <p><strong>Country:</strong> ${order.shippingCountry}</p>
    </div>

    <!-- Order Details -->
    <h3>Order Details</h3>
    <table>
        <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${orderItems}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.productPrice}</td>
                <td>${item.quantity}</td>
                <td>${item.productPrice * item.quantity}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Total Price -->
    <div>
        <p><strong>Total: </strong>${order.totalPrice}</p>
    </div>

    <!-- Payment Status -->
    <div>
        <h3>Payment Status</h3>
        <p>Your payment was successfully processed via ${order.paymentMethod}.</p>
    </div>

    <!-- Thank You Message -->
    <p>If you have any questions, please feel free to contact us at <a href="mailto:support@yourecommerce.com">support@yourecommerce.com</a>.</p>

</main>

<!-- Footer -->
<jsp:include page="footer.jsp" />

</body>
</html>

