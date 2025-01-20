<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/16/2025
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<jsp:include page="navbar.jsp" />

<!-- Product Filters Section -->
<section class="container mt-4">
    <div class="row">
        <div class="col-md-3">
            <h4>Filter Products</h4>
            <!-- Category Filter -->
            <div class="mb-3">
                <label for="categorySelect" class="form-label">Category</label>
                <select class="form-select" id="categorySelect" onchange="filterByCategory()">
                    <option value="">All Categories</option>
                    <option value="electronics">Electronics</option>
                    <option value="clothing">Clothing</option>
                    <option value="home-kitchen">Home & Kitchen</option>
                </select>
            </div>
            <!-- Price Range Filter -->
            <div class="mb-3">
                <label for="priceRange" class="form-label">Price Range</label>
                <input type="range" class="form-range" id="priceRange" min="0" max="1000" step="50" onchange="filterByPrice()" />
                <span id="priceValue">Max Price: $1000</span>
            </div>
        </div>

        <!-- Product Listings -->
        <div class="col-md-9">
            <h2>Featured Products</h2>
            <div class="row" id="product-list">
                <!-- Example Product Cards (these will be dynamically loaded from the database) -->
                <div class="col-md-4 product-card" data-category="electronics" data-price="299.99">
                    <div class="card">
                        <img src="https://via.placeholder.com/500x300" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">Product 1</h5>
                            <p class="card-text">$299.99</p>
                            <a href="product_detail.jsp?productId=1" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 product-card" data-category="clothing" data-price="49.99">
                    <div class="card">
                        <img src="https://via.placeholder.com/500x300" class="card-img-top" alt="Product 2">
                        <div class="card-body">
                            <h5 class="card-title">Product 2</h5>
                            <p class="card-text">$49.99</p>
                            <a href="product_detail.jsp?productId=2" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 product-card" data-category="home-kitchen" data-price="89.99">
                    <div class="card">
                        <img src="https://via.placeholder.com/500x300" class="card-img-top" alt="Product 3">
                        <div class="card-body">
                            <h5 class="card-title">Product 3</h5>
                            <p class="card-text">$89.99</p>
                            <a href="product_detail.jsp?productId=3" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <!-- Add more products as needed -->
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Handle Category Filter
    function filterByCategory() {
        var selectedCategory = document.getElementById("categorySelect").value;
        var productCards = document.querySelectorAll(".product-card");
        productCards.forEach(function(card) {
            var category = card.getAttribute("data-category");
            if (selectedCategory === "" || selectedCategory === category) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        });
    }

    // Handle Price Range Filter
    function filterByPrice() {
        var maxPrice = document.getElementById("priceRange").value;
        var priceText = document.getElementById("priceValue");
        priceText.innerHTML = "Max Price: $" + maxPrice;
        var productCards = document.querySelectorAll(".product-card");
        productCards.forEach(function(card) {
            var price = parseFloat(card.getAttribute("data-price"));
            if (price <= maxPrice) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        });
    }
</script>
</body>
</html>

