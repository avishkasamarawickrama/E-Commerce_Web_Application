<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>


<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="index.jsp">KIDDS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <!-- Shop Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="shopDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Shop
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="shopDropdown">
                        <li><a class="dropdown-item" href="product_list.jsp">All Products</a></li>
                        <li><a class="dropdown-item" href="products.jsp">Products</a></li>
                        <li><a class="dropdown-item" href="orders.jsp">Orders</a></li>
                        <li><a class="dropdown-item" href="order_history.jsp">Order Details</a></li>
                        <li><a class="dropdown-item" href="category.jsp">Category</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="categoryDropdown" role="button" data-bs-toggle="dropdown">
                        Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="categoryDropdown">

                        <li><a class="dropdown-item" href="baby.jsp"> Baby Items</a></li>
                        <li><a class="dropdown-item" href="toys.jsp">Toys</a></li>
                        <li><a class="dropdown-item" href="clothing.jsp">Clothing</a></li>
                        <li><a class="dropdown-item" href="jewelry.jsp">Feeding</a></li>
                        <li><a class="dropdown-item" href="beauty.jsp">Diapers </a></li>
                        <li><a class="dropdown-item" href="nursery.jsp">Nursery </a></li>
                        <li><a class="dropdown-item" href="safety.jsp">Health & Safety</a></li>

                    </ul>
                </li>

            </ul>
            <form class="d-flex me-2">
                <input class="form-control me-2" type="search" placeholder="Search for products..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link text-white" href="cart.jsp">Cart</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="user_profile.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="settings.jsp">Settings</a></li>
            </ul>
            <!-- Add a Login Button -->
            <div  class="text-center my-4" >
                <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#loginModal" >
                    Login
                </button>
            </div>

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
                            <br>
                            <form action="logout" method="post">
                            <a  href="logout.jsp" >Logout</a>
                            </form>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</nav>




</body>
</html>
