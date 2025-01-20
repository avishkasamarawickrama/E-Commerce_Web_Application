<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="java.util.*, java.text.*, com.yourpackage.model.Order, com.yourpackage.model.Product" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp" />

<header>
    <h1>Checkout Page</h1>
    <nav>
        <a href="home.jsp">Home</a> |
        <a href="cart.jsp">Cart</a> |
        <a href="profile.jsp">Profile</a>
    </nav>
</header>

<main>
    <h2>Review Your Order</h2>
    <form action="view_order.jsp" method="post">
        <!-- Display cart items -->
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
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.quantity}</td>
                    <td>${item.productPrice * item.quantity}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Display total price -->
        <div>
            <p><strong>Total: </strong>${totalPrice}</p>
        </div>

        <!-- Shipping address form -->
        <h3>Shipping Information</h3>
        <label for="address">Address:</label>
        <input type="text" name="address" id="address" required><br>

        <label for="city">City:</label>
        <input type="text" name="city" id="city" required><br>

        <label for="zipcode">Zip Code:</label>
        <input type="text" name="zipcode" id="zipcode" required><br>

        <label for="country">Country:</label>
        <input type="text" name="country" id="country" required><br>

        <!-- Payment method -->
        <h3>Payment Method</h3>
        <select name="paymentMethod">
            <option value="creditCard">Credit Card</option>
            <option value="paypal">PayPal</option>
            <option value="bankTransfer">Bank Transfer</option>
        </select><br>

        <button type="submit">Place Order</button>
    </form>
</main>


<jsp:include page="footer.jsp" />
</body>
</html>

