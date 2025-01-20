<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container my-5">
    <h2 class="text-center mb-4">Edit Product</h2>

    <%
        int productId = 0;
        try {
            productId = Integer.parseInt(request.getParameter("productId"));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid product ID.");
        }

        if (productId > 0) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/ecommerce";
                String dbUser = "root";
                String dbPassword = "Ijse@123";

                // Establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Fetch product details
                String query = "SELECT * FROM products WHERE id = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, productId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("product", rs);
                } else {
                    request.setAttribute("errorMessage", "Product not found.");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while fetching product details.");
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        }
    %>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger text-center">
                ${errorMessage}
        </div>
    </c:if>

    <c:if test="${not empty product}">
        <form action="update_product.jsp" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="productId" value="${product.id}" />
            <div class="mb-3">
                <label for="name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="${product.price}" required>
            </div>
            <div class="mb-3">
                <label for="stock" class="form-label">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" value="${product.stock}" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="products.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </c:if>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>

