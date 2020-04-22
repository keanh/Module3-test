<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/04/2020
  Time: 4:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
<center>
    <h2>
        <a href="home?action=home">List All Products</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Update Product
                </h2>
            </caption>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${product.name}'/>">
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${product.price}' />">
                </td>
            </tr>
            <tr>
                <th>Quantity:</th>
                <td>
                    <input type="text" name="quantity" size="15"
                           value="<c:out value='${product.quantity}' />">
                </td>
            </tr>
            <tr>
                <th>Color:</th>
                <td>
                    <input type="text" name="color" size="15"
                           value="<c:out value='${product.color}' />">
                </td>
            </tr>
            <tr>
                <th>Description:</th>
                <td>
                    <input type="text" name="description" size="15"
                           value="<c:out value='${product.description}' />">
                </td>
            </tr>
            <tr>
                <th>Category:</th>
                <td>
                    <select class="custom-select" name="category">
                        <option selected>Choose...</option>
                        <option value="1">Phone</option>
                        <option value="2">Television</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="update"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
