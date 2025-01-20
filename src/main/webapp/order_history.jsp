<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <link rel="stylesheet" href="styles.css"> <!-- Include your CSS file -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    .container {
        margin: 20px auto;
        max-width: 800px;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
    }

    .table th, .table td {
        padding: 10px;
        text-align: left;
    }

    .table th {
        background-color: #343a40;
        color: white;
    }

</style>
<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-4">
    <h1 class="text-center">Order History</h1>
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Items</th>
            <th>Total Amount</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Database connection setup
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL driver
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Ijse@123");

                // Query to fetch order history for the logged-in user
                String query = "SELECT * FROM orders WHERE user_id = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, (Integer) session.getAttribute("userId")); // Assuming userId is stored in session
                rs = ps.executeQuery();

                // Loop through the result set and display data
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("order_id") %></td>
            <td><%= rs.getDate("order_date") %></td>
            <td><%= rs.getString("items") %></td>
            <td><%= rs.getDouble("total_amount") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
//                out.println("<tr><td colspan='5' class='text-center text-danger'>Error: " + e.getMessage() + "</td></tr>");
        %>
        <tr>
            <td colspan="5" class="text-center text-danger">Error: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>

