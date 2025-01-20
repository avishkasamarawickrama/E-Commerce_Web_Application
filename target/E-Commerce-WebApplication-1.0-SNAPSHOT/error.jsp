<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 1:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-container {
            text-align: center;
            padding: 20px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .error-code {
            font-size: 4rem;
            color: #dc3545;
        }
        .error-message {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1 class="error-code">Oops!</h1>
    <p class="error-message">An unexpected error occurred. Please try again later.</p>
    <p>If the problem persists, contact our support team for assistance.</p>
    <a href="index.jsp" class="btn btn-primary">Go to Homepage</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
