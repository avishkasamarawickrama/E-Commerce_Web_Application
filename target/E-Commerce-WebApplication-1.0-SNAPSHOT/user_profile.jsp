<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.sql.DataSource" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        .profile-container {
            margin: 30px auto;
            max-width: 800px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-actions button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<%
    // Ensure the user is logged in
    String Username = (String) session.getAttribute("username");
    if (Username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Initialize variables for user data
    String username = "";
    String email = "";
    String password = "";
    String role = "";


    // Fetch user data from the database
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Database connection (adjust based on your setup)
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Ijse@123");

        // Query to fetch user data
        String query = "SELECT username, email, role,  FROM users WHERE username = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        rs = stmt.executeQuery();

        // Populate user data
        if (rs.next()) {
            username = rs.getString("full_name");
            email = rs.getString("email");
            role = rs.getString("role");

        } else {
            response.sendRedirect("login.jsp");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<div class="profile-container bg-light p-4 shadow-sm rounded">
    <div class="profile-header">
        <h2>Your Profile</h2>
        <p>Manage your personal information and settings.</p>
    </div>

    <div class="row mb-4">
        <div class="col-md-6">
            <h5>Personal Information</h5>
            <p><strong>Full Name:</strong> <%= username %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Address:</strong> <%= role %></p>
        </div>
        <div class="col-md-6">
            <h5>Account Details</h5>
            <p><strong>Username:</strong> <%= username %></p>
        </div>
    </div>

    <div class="profile-actions text-center">
        <a href="edit_profile.jsp" class="btn btn-primary">Edit Profile</a>
        <a href="order_history.jsp" class="btn btn-secondary">View Orders</a>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
