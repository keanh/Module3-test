<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/04/2020
  Time: 4:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Product</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/view/create.css">
</head>
<body>
<div class="container">
    <h1 class="well">Create Form</h1>
    <div class="col-lg-12 well">
        <div class="row">
            <form method="post">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <label>Name</label>
                            <input type="text" placeholder="Enter Name Product Here.." class="form-control" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="text" placeholder="Enter Price Here.." class="form-control" name="price">
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="text" placeholder="Enter Quantity Here.." class="form-control" name="quantity">
                    </div>
                    <div class="form-group">
                        <label>Color</label>
                        <input type="text" placeholder="Enter Color Here.." class="form-control" name="color">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input type="text" placeholder="Enter Description Here.." class="form-control" name="description">
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select class="custom-select" name="category">
                            <option selected>Choose...</option>
                            <option value="1">Phone</option>
                            <option value="2">Television</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-lg btn-info">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
