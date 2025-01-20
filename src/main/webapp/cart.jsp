<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping Cart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/styles.css">
  <style>
    /* General Page Styling */
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }

    /* Header Styling */
    header {
      background: linear-gradient(90deg, #4caf50, #087f23);
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* Shopping Cart Table */
    .cart-table {
      background-color: #ffffff;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .cart-table th {
      background-color: #4caf50;
      color: #ffffff;
      text-align: center;
      padding: 10px;
    }

    .cart-table td {
      text-align: center;
      vertical-align: middle;
      padding: 10px;
    }

    .cart-table img {
      max-width: 100px;
      height: auto;
      border-radius: 5px;
    }

    /* Buttons */
    .btn-primary {
      background-color: #4caf50;
      border: none;
    }

    .btn-primary:hover {
      background-color: #087f23;
    }

    .btn-danger {
      background-color: #dc3545;
    }

    .btn-danger:hover {
      background-color: #c82333;
    }

    .btn-success {
      background-color: #28a745;
    }

    .btn-success:hover {
      background-color: #218838;
    }

    .btn-secondary {
      background-color: #6c757d;
    }

    .btn-secondary:hover {
      background-color: #5a6268;
    }

    /* Forms */
    input[type="number"] {
      text-align: center;
    }

    /* Total Section */
    .text-end h4 {
      font-size: 1.5rem;
      margin-bottom: 20px;
      color: #333333;
    }

  </style>
</head>
<body>



<jsp:include page="navbar.jsp"/>

<header class="bg-dark text-white py-3 text-center">
  <h1>Your Shopping Cart</h1>
</header>

<div class="container my-5">
  <%
    // Simulate a session-based cart (in a real application, this would be stored in the session)
    ArrayList<HashMap<String, String>> cart = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");
    if (cart == null) {
      cart = new ArrayList<>();
      session.setAttribute("cart", cart);
    }

    double total = 0.0;

    if (cart.isEmpty()) {
  %>
  <div class="alert alert-warning text-center">
    Your cart is empty. <a href="product_list.jsp" class="alert-link">Continue shopping</a>.
  </div>
  <% } else { %>
  <table class="table table-bordered cart-table">
    <thead>
    <tr>
      <th>Image</th>
      <th>Product</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Subtotal</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (HashMap<String, String> item : cart) {
        String productName = item.get("name");
        String productImage = item.get("image");
        double productPrice = Double.parseDouble(item.get("price"));
        int productQuantity = Integer.parseInt(item.get("quantity"));
        double subtotal = productPrice * productQuantity;

        total += subtotal;
    %>
    <tr>
      <td><img src="<%= productImage %>" alt="<%= productName %>"></td>
      <td><%= productName %></td>
      <td>$<%= String.format("%.2f", productPrice) %></td>
      <td>
        <form method="post" action="update_cart.jsp">
          <input type="hidden" name="productName" value="<%= productName %>">
          <input type="number" name="quantity" value="<%= productQuantity %>" min="1" class="form-control" style="width: 80px;">
          <button type="submit" class="btn btn-primary btn-sm mt-2">Update</button>
        </form>
      </td>
      <td>$<%= String.format("%.2f", subtotal) %></td>
      <td>
        <a href="remove_from_cart.jsp?productName=<%= productName %>" class="btn btn-danger btn-sm">Remove</a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <div class="text-end">
    <h4>Total: $<%= String.format("%.2f", total) %></h4>
    <a href="checkout.jsp" class="btn btn-success btn-lg">Proceed to Checkout</a>
    <a href="product_list.jsp" class="btn btn-secondary btn-lg">Continue Shopping</a>
  </div>
  <% } %>
</div>

<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>
