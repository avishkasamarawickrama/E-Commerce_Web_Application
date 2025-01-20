<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapplication.Model.Category" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container my-5">
    <h2 class="text-center mb-4">Add New Category</h2>

    <!-- Display success message -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <!-- Display error message -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <!-- Category Form -->
    <form method="post" action="add-category" class="mx-auto" style="max-width: 500px;">
        <div class="mb-3">
            <label for="categoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Enter category name" required>
        </div>
        <div class="mb-3">
            <label for="categoryDescription" class="form-label">Category Description</label>
            <textarea class="form-control" id="categoryDescription" name="categoryDescription" placeholder="Enter category description"></textarea>
        </div>
        <button type="submit" class="btn btn-primary w-100">Add Category</button>
    </form>

    <h3 class="text-center mt-5">Existing Categories</h3>
    <table class="table table-bordered mt-3">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null) {
                for (Category category : categories) {
        %>
        <tr>
            <td><%= category.getId() %></td>
            <td><%= category.getName() %></td>
            <td><%= category.getDescription() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" class="text-center text-danger">No categories found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
