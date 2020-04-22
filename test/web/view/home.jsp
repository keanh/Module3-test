<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/04/2020
  Time: 2:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<h1 align="center">Test module 3</h1>
<div class="container" align="center">
    <div class="row col-md-10 col-md-offset-1 custyle">
        <form method="post" action="/home?action=search" style="width: 200px">
            <input placeholder="Bạn cần tìm..." name="search" id="search" class="form-control" size="45"/>
            <br>
            <div align="center">
                <button type="submit" class="btn btn-primary" style="text-align: center">Tìm kiếm</button>
            </div>
        </form>
        <table class="table table-striped custab">
            <thead>
            <a href="/home?action=create" class="btn btn-primary btn-xs pull-left"><b>+</b> Add new categories</a>
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Color</th>
                <th>Category</th>
                <th class="text-center">Action</th>
            </tr>
            </thead>
            <c:forEach items="${listProduct}" var="product">
                <tr>
                    <td><c:out value="${product.id}"/> </td>
                    <td><c:out value="${product.name}"/> </td>
                    <td><c:out value="${product.price}"/> </td>
                    <td><c:out value="${product.quantity}"/> </td>
                    <td><c:out value="${product.color}"/> </td>
                    <td><c:out value="${product.category}"/> </td>
                    <td class="text-center"><a class='btn btn-info btn-xs' href="/home?action=update&id=${product.id}"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="/home?action=delete&id=${product.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
