<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        /* Table Styles */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* No Categories Found Message */
        .no-category {
            text-align: center;
            color: #555;
            font-style: italic;
        }

        /* Back Link Styles */
        a {
            display: block;
            width: 200px;
            margin: 20px auto;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
<body>
<h1>All Products</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Category ID</th>
        <th>Quantity</th>
    </tr>
    <%
        List<String[]> products = (List<String[]>) request.getAttribute("products");
        if (products != null) {
            for (String[] product : products) {
    %>
    <tr>
        <td><%= product[0] %></td>
        <td><%= product[1] %></td>
        <td><%= product[2] %></td>
        <td><%= product[3] %></td>
        <td><%= product[4] %></td>
        <td><%= product[5] %></td>
    </tr>
    <%      }
    } else { %>
    <tr>
        <td colspan="6" class="no-product">No products found!</td>
    </tr>
    <% } %>
</table>
<br>
<a href="products.jsp">Back to Product Management</a>

</body>
</html>
