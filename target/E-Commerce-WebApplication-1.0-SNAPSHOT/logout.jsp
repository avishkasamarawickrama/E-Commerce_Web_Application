<%--
  Created by IntelliJ IDEA.
  User: HI
  Date: 1/18/2025
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log out the user
    session.invalidate();

    // Redirect the user to the login page or homepage
    response.sendRedirect("login.jsp");
%>


</body>
</html>
