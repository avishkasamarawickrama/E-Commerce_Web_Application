<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/24/2025
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Orders  </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        h1 {
            font-weight: 600;
            margin-bottom: 30px;
            color: #333;
            text-align: center;
        }


        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: 500;
            margin-bottom: 8px;
            display: inline-block;
        }

        select, input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            font-weight: 500;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: 500;
        }

        .message p {
            padding: 10px;
            border-radius: 5px;
        }

        .message p.success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .message p.error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

    </style>

    <script>
        function toggleFields(action) {
            // Hide all fields initially
            document.getElementById("idField").style.display = "none";
            document.getElementById("user_idField").style.display = "none";
            document.getElementById("totalPriceField").style.display = "none";
            document.getElementById("order_dateField").style.display = "none";
            document.getElementById("statusField").style.display = "none";


            // Show fields based on action
            if (action === "save") {
                document.getElementById("idField").style.display = "block";
                document.getElementById("user_idField").style.display = "block";
                document.getElementById("totalPriceField").style.display = "block";
                document.getElementById("order_dateField").style.display = "block";
                document.getElementById("statusField").style.display = "block";

                fetchNextProductId();
            }
            if (action === "delete" || action === "update") {
                document.getElementById("idField").style.display = "block";
                document.getElementById("user_idField").style.display = "block";
                if (action === "update") {
                    document.getElementById("totalPriceField").style.display = "block";
                    document.getElementById("order_dateField").style.display = "block";
                    document.getElementById("statusField").style.display = "block";
                }
            }
        }
        function fetchOrdersByName(user_id) {
            if (!user_id) return;
            fetch(`getOrdersByName?name=${user_id}`)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        document.querySelector('input[name="id"]').value = data.id || '';
                        document.querySelector('input[name="user_id"]').value = data.user_id || '';
                    }
                })
                .catch(error => console.error('Error fetching order details:', error));
        }
        function fetchNextProductId() {
            fetch('getNextOrderId')
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        document.querySelector('input[name="id"]').value = data.nextId || '';
                    }
                })
                .catch(error => console.error('Error fetching next order ID:', error));
        }

    </script>
</head>
<body>
<jsp:include page="navbar.jsp" />

<h1> orders Management</h1>
<form action="orders" method="post">
    <label>Select Operation:</label><br>
    <select name="action" onchange="toggleFields(this.value)" required>
        <option value="">--Select--</option>
        <option value="save">Save</option>
        <option value="delete">Delete</option>
        <option value="update">Update</option>
        <option value="view">View All Orders</option>
    </select>
    <br><br>

    <div id="idField" style="display: none;">
        <label>ID:</label><br>
        <input type="text" name="id"><br><br>
    </div>
    <div id="user_idField" style="display: none;">
        <label>ID:</label><br>
        <input type="text" name="user_id"><br><br>
    </div>
    <div id="total_priceField" style="display: none;">
        <label>Name:</label><br>
        <input type="text" name="total_price"><br><br>
    </div>
    <div id="order_dateField" style="display: none;">
        <label>Description:</label><br>
        <input type="text" name="order_date"><br><br>
    </div>
    <div id="statusField" style="display: none;">
        <label>Description:</label><br>
        <input type="text" name="status"><br><br>
    </div>

    <button type="submit">Submit</button>
</form>

<!-- Message Display -->
<% String message = request.getParameter("message"); %>
<% String error = request.getParameter("error"); %>
<% if (message != null) { %>
<p style="color:green;"><%= message %></p>
<% } %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>



<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

