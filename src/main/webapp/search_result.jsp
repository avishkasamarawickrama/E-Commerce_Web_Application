<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .product-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px 0;
            padding: 15px;
            transition: box-shadow 0.3s;
        }
        .product-card:hover {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            width: 100px;
            height: auto;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container my-5">
    <h2 class="text-center mb-4">Search Results</h2>

    <%
        String searchQuery = request.getParameter("q");
        if (searchQuery == null || searchQuery.trim().isEmpty()) {
    %>
    <div class="alert alert-warning text-center">
        No search term provided. <a href="index.jsp" class="alert-link">Go back to the homepage</a>.
    </div>
    <%
    } else {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Database connection details (replace with your DB info)
            String dbURL = "jdbc:mysql://localhost:3306/ecommerce";
            String dbUser = "root";
            String dbPassword = "Ijse@123";

            // Establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to search for products
            String sql = "SELECT * FROM products WHERE name LIKE ? OR description LIKE ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + searchQuery + "%");
            stmt.setString(2, "%" + searchQuery + "%");

            rs = stmt.executeQuery();

            if (!rs.isBeforeFirst()) { // Check if no results
    %>
    <div class="alert alert-danger text-center">
        No results found for '<strong><%= searchQuery %></strong>'.
    </div>
    <%
    } else {
    %>
    <div class="row">
        <%
            while (rs.next()) {
                String productName = rs.getString("name");
                String productImage = rs.getString("image_url");
                String productDescription = rs.getString("description");
                double productPrice = rs.getDouble("price");
        %>
        <div class="col-md-4">
            <div class="product-card">
                <img src="<%= productImage %>" alt="<%= productName %>" class="product-image">
                <h5><%= productName %></h5>
                <p><%= productDescription %></p>
                <p class="text-success">$<%= String.format("%.2f", productPrice) %></p>
                <a href="product_details.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary">View Details</a>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    %>
    <div class="alert alert-danger">
        An error occurred while processing your search. Please try again later.
    </div>
    <%
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        }
    %>
</div>

<jsp:include page="footer.jsp" />
<script src="resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>
