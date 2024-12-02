<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Order History</title> 
    <link rel="stylesheet" href="css/dashboard.css">
  
</head>
<body>
    <h1>All Orders</h1>
	<div class="container">
	    <table class="table">
	        <thead>
	            <tr>
	                <th>Order ID</th>
	                <th>User Name</th>
	                <th>User Address</th>
	                <th>User Phone</th>
	                <th>Item IDs</th>
	                <th>Order Time</th>
	                <th>Total Price</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="order" items="${orders}">
	                <tr>
	                    <td>${order.orderId}</td>
	                    <td>${order.userName}</td>
	                    <td>${order.userAddress}</td>
	                    <td>${order.userPhone}</td>
	                    <td>${order.itemIds}</td>
	                    <td>${order.orderDate}</td>
	                    <td>${order.totalPrice}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
</body>
</html>
