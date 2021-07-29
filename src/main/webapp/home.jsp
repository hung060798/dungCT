<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/7/2021
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>hello</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #f5f6f7;
    }
    p {font-size: 16px;}
    .margin {margin-bottom: 45px;}
    .bg-1 {
      background-color: #1abc9c; /* Green */
      color: #ffffff;
    }
    .bg-2 {
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
    }
    .bg-3 {
      background-color: #ffffff; /* White */
      color: #555555;
    }
    .bg-4 {
      background-color: #2f2f2f; /* Black Gray */
      color: #fff;
    }
    .container-fluid {
      padding-top: 70px;
      padding-bottom: 70px;
    }
    .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
    }
    .navbar-nav  li a:hover {
      color: #1abc9c !important;
    }
  </style>
</head>
<body>


<div class="container-fluid bg-3 text-center">
  <h3 class="margin">so sad</h3><br>
  <div class="row">

    <c:forEach items="${listProduct}" var="product" varStatus="loop">
      <div class="col-sm-4">
        <img src="${product.img}" class="img-responsive margin" style="width:100%; height: 300px" alt="Image">
        <p>${product.name}</p>
        <p>${product.price}</p>
        <a href="/?action=create" class="btn btn-success">Create</a>
        <a  href="/?action=edit&index=${loop.index}" class="btn btn-warning">Edit</a>
        <a href="/?action=delete&index=${loop.index}" class="btn btn-danger">Delete</a>
      </div>
    </c:forEach>

  </div>
</div>
</body>
</html>
