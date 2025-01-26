<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/16/2025
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Commerce Application</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <link rel="icon" href="/assest/e-commerce%20logo.png">
  <style>

    /* General Styling */
    body {
      font-family: 'Poppins', sans-serif;
      line-height: 1.6;
    }

    h1, h2, h5 {
      font-weight: bold;
    }

    a {
      text-decoration: none;
    }

    .btn {
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .btn:hover {
      transform: scale(1.05);
    }

    /* Navbar Styling */
    nav {
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* Carousel Styling */
    #carouselExampleCaptions {
      height: 50vh;
    }

    .carousel-inner {
      height: 100%;
    }

    .carousel-item img {
      height: 100%;
      width: 100%;
      object-fit: cover;
      filter: brightness(0.9); /* Slight darkening for better text visibility */
    }

    .carousel-caption {
      background: rgba(0, 0, 0, 0.6);
      padding: 15px;
      border-radius: 8px;
      top: 50%;
      transform: translateY(-50%);
    }

    /* Hero Section */
    .hero-section {
      background: linear-gradient(to bottom, #007bff, #0056b3);
      color: white;
    }

    /* Category Section */
    .category-icon img {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .category-icon img:hover {
      transform: scale(1.1);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    /* Special Deals */
    .card {
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
      transition: transform 0.3s ease;
    }

    .card:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .card .btn {
      background-color: #28a745;
      color: white;
    }

    .card .btn:hover {
      background-color: #218838;
    }

    /* Footer */
    footer {
      background: #343a40;
      color: #ccc;
      padding: 20px 0;
      text-align: center;
    }

    footer a {
      color: #ffc107;
    }

    #carouselExampleCaptions {
      height: 50vh; /* Set carousel height to 50% of the viewport */
    }

    /* Ensure images fill the carousel */
    .carousel-inner {
      height: 100%; /* Match the height of the carousel container */
    }

    .carousel-item img {
      height: 100%; /* Fill the height of the carousel */
      width: 100%; /* Full width of the viewport */
      object-fit: cover; /* Maintain aspect ratio and fill the space */
    }

    /* Center the captions vertically */
    .carousel-caption {
      top: 50%;
      transform: translateY(-50%);
    }
    /* Uniform sizes for section images */
    .hero-section {
      height: 300px; /* Adjust as needed */
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .category-icon img {
      width: 100px; /* Set the fixed width */
      height: 100px; /* Set the fixed height */
      object-fit: cover; /* Ensure images scale correctly */
      border-radius: 50%; /* Make the image circular */
      border: 2px solid #ddd; /* Optional: Add a border for better visibility */
      transition: transform 0.3s ease; /* Add hover effect transition */
    }

    .category-icon img:hover {
      transform: scale(1.1); /* Slight zoom effect on hover */
      border-color: #007bff; /* Change border color on hover */
    }

    .category-icon p {
      margin-top: 10px; /* Space between the image and text */
      font-weight: bold; /* Make the category name bold */
      color: #333; /* Adjust text color */
    }
    .card img,
    .rounded-circle {
      width: 100%; /* Full width */
      height: 200px; /* Fixed height */
      object-fit: cover; /* Maintain aspect ratio, fill container */
    }
    .card {
      margin-bottom: 20px; /* Space between cards */

    }


  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">KIDDS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <!-- Shop Dropdown -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="shopDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
          <ul class="dropdown-menu" aria-labelledby="shopDropdown">
            <li><a class="dropdown-item" href="product_list.jsp">All Products</a></li>
          </ul>
        </li>
        <!-- Categories Dropdown -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="categoryDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categories</a>
          <ul class="dropdown-menu" aria-labelledby="categoryDropdown">
            <li><a class="dropdown-item" href="categoryitem.jsp?category=electronics">Baby Items</a></li>
            <li><a class="dropdown-item" href="categoryitem.jsp?category=clothing">Toys</a></li>
            <li><a class="dropdown-item" href="categoryitem.jsp?category=home-kitchen">Clothing</a></li>
            <li><a class="dropdown-item" href="categoryitem.jsp?category=jewelry">Feeding</a></li>
            <li><a class="dropdown-item" href="categoryitem.jsp?category=beauty">Diapers</a></li>
            <li><a class="dropdown-item" href="categoryitem.jsp?category=baby">Nursery</a></li>
            <li><a class="dropdown-item" href="categoryitem.jsp?category=women">Health & Safety</a></li>
          </ul>
        </li>
      </ul>
      <!-- Search Form -->
      <form class="d-flex me-3">
        <input class="form-control me-2" type="search" placeholder="Search for products..." aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
      <!-- Login Button -->
      <button type="button" class="btn btn-light login-btn" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
    </div>
  </div>
</nav>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Login to Your Account</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="login" method="post">
          <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
          </div>
          <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="rememberMe">
            <label class="form-check-label" for="rememberMe">Remember me</label>
          </div>
          <button type="submit" class="btn btn-primary w-100"><a class="nav-link text-white" href="home.jsp">Login</a></button>
        </form>
      </div>
      <div class="modal-footer">
        <p class="text-center w-100">Don't have an account? <a href="register.jsp">Register now</a></p>
      </div>
    </div>
  </div>
</div>


<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <!-- Indicators -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>

  <!-- Carousel Inner -->
  <div class="carousel-inner">
    <!-- Slide 1 -->
    <div class="carousel-item active">
      <img src="assest/carousel.png" class="d-block w-100" alt="Exclusive Deals">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">What's New Now</h5>
        <p>Explore the latest arrivals and exclusive collections.</p>
        <a href="home.jsp" class="btn btn-primary btn-lg">Shop Now</a>
      </div>
    </div>
    <!-- Slide 2 -->
    <div class="carousel-item">
      <img src="assest/carousel%202.png" class="d-block w-100" alt="Holiday Specials">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">Happy BABY</h5>
        <p>Grab the best deals this season and save big!</p>
        <a href="product_list.jsp" class="btn btn-light btn-lg">View Deals</a>
      </div>
    </div>
    <!-- Slide 3 -->
    <div class="carousel-item">
      <img src="assest/carousel%203.png" class="d-block w-100" alt="Top Sellers">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">Top Sellers</h5>
        <p>Shop our most popular products now in stock!</p>
        <a href="product_list.jsp" class="btn btn-warning btn-lg">Explore More</a>
      </div>
    </div>
  </div>

  <!-- Navigation Controls -->
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Hero Section -->
<section class="hero-section text-center text-white bg-dark py-5">
  <h1>Welcome to Our KIDDS Store</h1>
  <p>Discover the best deals this holiday season!</p>
  <a href="home.jsp" class="btn btn-light btn-lg">Shop Now</a>
</section>


<section class="container my-4">
  <h2 class="text-center mb-3">Shop by Category</h2>
  <div class="row text-center">
    <div class="col-md-4 category-icon">
      <a href="toys.jsp">
        <img src="assest/toys.png" alt="toys" class="img-fluid">
        <p>Toys</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="clothing.jsp">
        <img src="assest/winter%20bby.png" alt="Clothing" class="img-fluid">
        <p>Clothing</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="feeding.jsp">
        <img src="assest/baby%20feeding.png" alt="feeding" class="img-fluid">
        <p>Feeding</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="diapers.jsp">
        <img src="assest/diapers4.png" alt="diapers" class="img-fluid">
        <p>Diapers</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="nursery.jsp">
        <img src="assest/nursery.png" alt="nursery" class="img-fluid">
        <p>Nursery</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="health.jsp">
        <img src="assest/safety.png" alt="health" class="img-fluid">
        <p>Health & Safety</p>
      </a>
    </div>
  </div>
</section>


<!-- Special Deals Section -->
<section class="container my-4">
  <h2 class="text-center mb-3">Special Holiday Deals</h2>
  <div class="row">
    <div class="col-md-3">
      <div class="card">
        <img src="assest/sale.png" class="card-img-top" alt="Deal 1">
        <div class="card-body">
          <h5 class="card-title">Toys</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="toys.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/diapers2.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Black Friday</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="health.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/clothes.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Clothing</h5>
          <p class="card-text">Up to 10% Off</p>
          <a href="clothing.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/winter%20bby.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">winter clothes</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="clothing.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/feeding%20details.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Feeding</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="feeding.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/nursery.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Nursery</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="=nursery.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/uilding%20blocks.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Baby toy sets</h5>
          <p class="card-text">Up to 10% Off</p>
          <a href="toys.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/nursery3.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Baby Crib</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="nursery.jsp" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="footer.jsp" />

<c:if test="${not empty errorMessage}">
  <div class="error">
    <p>${errorMessage}</p>
  </div>
</c:if>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
