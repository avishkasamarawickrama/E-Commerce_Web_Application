<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        header {
            background: linear-gradient(to right, #4caf50, #087f23);
            color: white;
        }
        .navbar {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .carousel-item img {
            height: 400px;
            object-fit: cover;
        }
        .card {
            border: 1px solid #ddd;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .card-title {
            font-weight: bold;
            color: #087f23;
        }
        .btn-primary {
            background-color: #4caf50;
            border: none;
        }
        .btn-primary:hover {
            background-color: #087f23;
        }
        .btn-success {
            background-color: #ffc107;
            border: none;
        }
        .btn-success:hover {
            background-color: #ffa000;
        }
        footer {
            background: linear-gradient(to right, #087f23, #4caf50);
            color: white;
        }
        footer a {
            text-decoration: none;
            color: #ffc107;
        }
        footer a:hover {
            color: #ffa000;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<header class="bg-dark text-white py-3 text-center">
    <h1>Our Products</h1>
    <p>Find the best deals and top-quality items!</p>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">E-Commerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product_list.jsp">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
            <form class="d-flex ms-auto">
                <input class="form-control me-2" type="search" placeholder="Search products" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="resources/assets/featured1.jpg" class="d-block w-100" alt="Featured 1">
            <div class="carousel-caption d-none d-md-block">
                <h5>Featured Product 1</h5>
                <p>High quality and great value.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="resources/assets/featured2.jpg" class="d-block w-100" alt="Featured 2">
            <div class="carousel-caption d-none d-md-block">
                <h5>Featured Product 2</h5>
                <p>Don't miss our special offer!</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="resources/assets/featured3.jpg" class="d-block w-100" alt="Featured 3">
            <div class="carousel-caption d-none d-md-block">
                <h5>Featured Product 3</h5>
                <p>Limited stock available!</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="container my-5">
    <h2>Product Categories</h2>
    <div class="btn-group mb-4" role="group" aria-label="Category Filters">
        <button type="button" class="btn btn-outline-primary">All</button>
        <button type="button" class="btn btn-outline-primary">Electronics</button>
        <button type="button" class="btn btn-outline-primary">Clothing</button>
        <button type="button" class="btn btn-outline-primary">Beauty</button>
    </div>

    <div class="row">
        <%
            String[][] products = {
                    {"1", "Product A", "resources/assets/product_a.jpg", "25.99"},
                    {"2", "Product B", "resources/assets/product_b.jpg", "18.49"},
                    {"3", "Product C", "resources/assets/product_c.jpg", "32.99"},
                    {"4", "Product D", "resources/assets/product_d.jpg", "12.99"}
            };

            for (String[] product : products) {
        %>

        <div class="col-md-3">
            <div class="card mb-4">
                <img src="<%= product[2] %>" class="card-img-top" alt="<%= product[1] %>">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= product[1] %></h5>
                    <p class="card-text">$<%= product[3] %></p>
                    <a href="product_detail.jsp?productId=<%= product[0] %>" class="btn btn-primary btn-sm">View Details</a>
                    <a href="add_to_cart.jsp?productId=<%= product[0] %>" class="btn btn-success btn-sm">Add to Cart</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>
