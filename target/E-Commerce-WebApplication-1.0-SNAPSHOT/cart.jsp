<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/17/2025
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.ArrayList" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping Cart</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: Arial, sans-serif;
    }
    .cart-header {
      margin-bottom: 20px;
    }
    .cart-table {
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }
    .cart-table th, .cart-table td {
      vertical-align: middle;
      text-align: center;
    }
    .cart-actions button {
      margin: 0 5px;
    }
    .checkout-btn {
      background-color: #007bff;
      color: #ffffff;
      border: none;
    }
    .checkout-btn:hover {
      background-color: #0056b3;
    }
    .empty-cart {
      margin-top: 50px;
      text-align: center;
      color: #6c757d;
    }
    .empty-cart a {
      text-decoration: none;
      color: #007bff;
    }
    .empty-cart a:hover {
      color: #0056b3;
    }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container mt-5">
  <h1 class="text-center cart-header">Shopping Cart</h1>
  <hr>


  <div class="table-responsive cart-table">
    <table class="table table-bordered">
      <thead class="table-dark">
      <tr>
        <th>Product</th>
        <th>Image</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>

      <tr>

          <form action="UpdateCartServlet" method="post" class="d-inline">
            <input type="hidden" name="productId" >
            <input type="number" name="quantity"  min="1" max="99" class="form-control w-50 mx-auto">
            <button type="submit" class="btn btn-sm btn-success mt-1">Update</button>
          </form>
        </td>
        <td></td>
        <td class="cart-actions">
          <form action="RemoveFromCartServlet" method="post" class="d-inline">
            <input type="hidden" name="productId" >
            <button type="submit" class="btn btn-sm btn-danger">Remove</button>
          </form>
        </td>
      </tr>

      </tbody>
      <tfoot>
      <tr>
        <th colspan="4" class="text-end">Total:</th>
        <th></th>
        <th></th>
      </tr>
      </tfoot>
    </table>
  </div>

  <div class="d-flex justify-content-between mt-3">
    <a href="products.jsp" class="btn btn-outline-primary">Continue Shopping</a>
    <a href="checkout.jsp" class="btn checkout-btn">Proceed to Checkout</a>
  </div>

</div>
<jsp:include page="footer.jsp" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
