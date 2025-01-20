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
  <link rel="stylesheet" href="styles.css">
  <style>

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
      <img src="assest/beauty.png" class="d-block w-100" alt="Exclusive Deals">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">What's New Now</h5>
        <p>Explore the latest arrivals and exclusive collections.</p>
        <a href="home.jsp" class="btn btn-primary btn-lg">Shop Now</a>
      </div>
    </div>
    <!-- Slide 2 -->
    <div class="carousel-item">
      <img src="../resources/assets/beauty.png" class="d-block w-100" alt="Holiday Specials">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">Holiday Specials</h5>
        <p>Grab the best deals this season and save big!</p>
        <a href="deals.jsp" class="btn btn-light btn-lg">View Deals</a>
      </div>
    </div>
    <!-- Slide 3 -->
    <div class="carousel-item">
      <img src="../resources/assets/beauty.png" class="d-block w-100" alt="Top Sellers">
      <div class="carousel-caption d-md-block">
        <h5 class="text-uppercase fw-bold">Top Sellers</h5>
        <p>Shop our most popular products now in stock!</p>
        <a href="bestsellers.jsp" class="btn btn-warning btn-lg">Explore More</a>
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


<!-- Category Icons Section -->
<section class="container my-4">
  <h2 class="text-center mb-3">Shop by Category</h2>
  <div class="row text-center">
    <div class="col-md-4">
      <a href="category.jsp?category=electronics">
        <img src="../resources/assets/electronic.png" alt="Electronics" class="img-fluid rounded-circle">
        <p>Electronics</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=clothing">
        <img src="../resources/assets/clothes.png" alt="Clothing" class="img-fluid rounded-circle">
        <p>Clothing</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=home-kitchen">
        <img src="../resources/assets/kitchen.png" alt="Home & Kitchen" class="img-fluid rounded-circle">
        <p>Home & Kitchen</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=jewelry">
        <img src="../resources/assets/jewelry.png" alt="Jewelry" class="img-fluid rounded-circle">
        <p>Jewelry & Accessories</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=beauty">
        <img src="../resources/assets/beauty.png" alt="Beauty & Health" class="img-fluid rounded-circle">
        <p>Beauty & Health</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=baby">
        <img src="../resources/assets/baby.png" alt="baby" class="img-fluid rounded-circle">
        <p>Baby Items</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=women">
        <img src="resources/assets/women.png" alt="women" class="img-fluid rounded-circle">
        <p>Women</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=men">
        <img src="resources/assets/jewelry.png" alt="men" class="img-fluid rounded-circle">
        <p>Men</p>
      </a>
    </div>
    <div class="col-md-4">
      <a href="category.jsp?category=bags">
        <img src="resources/assets/bags.png" alt="Bags " class="img-fluid rounded-circle">
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
        <img src="resources/assets/deal1.png" class="card-img-top" alt="Deal 1">
        <div class="card-body">
          <h5 class="card-title">Christmas Lights</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="deal.jsp?dealId=1" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="resources/assets/deal2.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Christmas Tree</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="deal.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="resources/assets/deal2.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Christmas Deco</h5>
          <p class="card-text">Up to 10% Off</p>
          <a href="deal.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="resources/assets/deal2.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Fancy Items</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="deal.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="resources/assets/deal2.png" class="card-img-top" alt="Deal 2">
        <div class="card-body">
          <h5 class="card-title">Ladies Bags</h5>
          <p class="card-text">Up to 50% Off</p>
          <a href="deal.jsp?dealId=2" class="btn btn-primary">Shop Now</a>
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
