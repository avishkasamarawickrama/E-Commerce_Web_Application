<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Details</title>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/styles.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    .product-image {
      max-width: 100%;
      height: auto;
      border: 1px solid #ddd;
      padding: 10px;
      background: #f8f9fa;
    }
    .btn-primary {
      background-color: #4caf50;
      border: none;
    }
    .btn-primary:hover {
      background-color: #087f23;
    }
    .btn-secondary {
      background-color: #ffc107;
      border: none;
    }
    .btn-secondary:hover {
      background-color: #ffa000;
    }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />


<header class="bg-dark text-white py-3 text-center">
  <h1>Product Details</h1>
</header>

<div class="container my-5">
  <%
    // Simulate a database or data source
    HashMap<String, String[]> productData = new HashMap<>();
    productData.put("1", new String[]{"Product A", "resources/assets/product_a.jpg", "25.99", "Description of Product A"});
    productData.put("2", new String[]{"Product B", "resources/assets/product_b.jpg", "18.49", "Description of Product B"});
    productData.put("3", new String[]{"Product C", "resources/assets/product_c.jpg", "32.99", "Description of Product C"});
    productData.put("4", new String[]{"Product D", "resources/assets/product_d.jpg", "12.99", "Description of Product D"});

    String productId = request.getParameter("productId");
    String[] product = productData.get(productId);

    if (product != null) {
  %>

  <div class="row">
    <div class="col-md-6">
      <img src="<%= product[1] %>" alt="<%= product[0] %>" class="product-image">
    </div>
    <div class="col-md-6">
      <h2><%= product[0] %></h2>
      <p><strong>Price:</strong> $<%= product[2] %></p>
      <p><%= product[3] %></p>
      <div class="mt-4">
        <a href="add_to_cart.jsp?productId=<%= productId %>" class="btn btn-primary btn-lg">Add to Cart</a>
        <a href="product_list.jsp" class="btn btn-secondary btn-lg">Back to Products</a>
      </div>
    </div>
  </div>

  <% } else { %>
  <div class="alert alert-danger" role="alert">
    Product not found. Please return to the <a href="product_list.jsp" class="alert-link">product list</a>.
  </div>
  <% } %>
</div>

<jsp:include page="footer.jsp" />

<script src="resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>
