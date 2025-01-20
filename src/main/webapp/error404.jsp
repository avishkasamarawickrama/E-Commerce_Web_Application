<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
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
            font-size: 6rem;
            color: #dc3545;
        }
        .error-message {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1 class="error-code">404</h1>
    <p class="error-message">Oops! The page you are looking for doesn't exist.</p>
    <a href="index.jsp" class="btn btn-primary">Go to Homepage</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
