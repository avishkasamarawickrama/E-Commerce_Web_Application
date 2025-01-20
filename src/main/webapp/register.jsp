<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="java.util.*, com.example.ecommerce.model.User" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp" />

<header>
    <h1>Create Your Account</h1>
    <nav>
        <a href="home.jsp">Home</a> |
        <a href="login.jsp">Login</a>
    </nav>
</header>

<main>
    <h2>Welcome! Please fill in the details below to create a new account.</h2>

    <!-- Registration Form -->
    <form action="register" method="post">
        <div>
            <label for="name">Full Name:</label>
            <input type="text" name="name" id="name" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
        </div>
        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" name="confirmPassword" id="confirmPassword" required>
        </div>
        <div>
            <button type="submit">Create Account</button>
        </div>
    </form>

    <!-- Display error message if any -->
    <c:if test="${not empty errorMessage}">
        <div class="error">
            <p>${errorMessage}</p>
        </div>
    </c:if>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
