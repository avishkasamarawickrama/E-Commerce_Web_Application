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
    .carousel-caption {
      background: rgba(0, 0, 0, 0.5);
      padding: 20px;
      border-radius: 10px;
    }

    .carousel-item img {
      filter: brightness(0.8);
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

<jsp:include page="navbar.jsp" />




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
      <img src="assest/now%20trendy%20caro.png" class="d-block w-100" alt="Exclusive Deals">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">What's New Now</h5>
        <p>Explore the latest arrivals and exclusive collections.</p>
        <a href="home.jsp" class="btn btn-primary btn-lg">Shop Now</a>
      </div>
    </div>
    <!-- Slide 2 -->
    <div class="carousel-item">
      <img src="assest/shopping%20carousel.png" class="d-block w-100" alt="Holiday Specials">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">Holiday Specials</h5>
        <p>Grab the best deals this season and save big!</p>
        <a href="product_list.jsp" class="btn btn-light btn-lg">View Deals</a>
      </div>
    </div>
    <!-- Slide 3 -->
    <div class="carousel-item">
      <img src="assest/caro%20girl%20jump.png" class="d-block w-100" alt="Top Sellers">
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
  <h1>Welcome to Our E-Commerce Store</h1>
  <p>Discover the best deals this holiday season!</p>
  <a href="home.jsp" class="btn btn-light btn-lg">Shop Now</a>
</section>


<section class="container my-4">
  <h2 class="text-center mb-3">Shop by Category</h2>
  <div class="row text-center">
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=electronics">
        <img src="assest/electronic.png" alt="Electronics" class="img-fluid">
        <p>Electronics</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=clothing">
        <img src="assest/clothes.png" alt="Clothing" class="img-fluid">
        <p>Clothing</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=home-kitchen">
        <img src="assest/kitchen.png" alt="Home & Kitchen" class="img-fluid">
        <p>Home & Kitchen</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=jewelry">
        <img src="assest/jewelry.png" alt="Jewelry" class="img-fluid">
        <p>Jewelry & Accessories</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=beauty">
        <img src="assest/beauty.png" alt="Beauty & Health" class="img-fluid">
        <p>Beauty & Health</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=baby">
        <img src="assest/kids.png" alt="Baby" class="img-fluid">
        <p>Baby Items</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=women">
        <img src="assest/caro%20girl%20jump.png" alt="Women" class="img-fluid">
        <p>Women</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=men">
        <img src="assest/boy%20with%20hat.png" alt="Men" class="img-fluid">
        <p>Men</p>
      </a>
    </div>
    <div class="col-md-4 category-icon">
      <a href="category.jsp?category=bags">
        <img src="assest/clothes.png" alt="Bags" class="img-fluid">
        <p>Bags</p>
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
          <h5 class="card-title">Christmas Lights</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="product_list.jsp?dealId=1" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/back%20friday%20sale.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Black Friday</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="product_list.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/samsung%20ultra.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Mobiles</h5>
          <p class="card-text">Up to 10% Off</p>
          <a href="deal.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/clothes.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">winter clothes</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="product_list.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/watch.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Ladies Watches</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="product_list.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/back%20friday%20sale.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Black Friday</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="product_list.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/samsung%20ultra.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Mobiles</h5>
          <p class="card-text">Up to 10% Off</p>
          <a href="deal.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="assest/back%20friday%20sale.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Black Friday</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="product_list.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <!-- Add more deals as needed -->
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
