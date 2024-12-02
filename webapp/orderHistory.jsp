<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh; 
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto; 
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden; 
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #000; 
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .item-list {
            list-style-type: none; 
            padding: 0; 
        }

        .item-list li {
            background: #f9f9f9;
            margin: 5px 0;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        /* Footer styles */
        footer {
           
            margin-top: auto; 
        }
    </style>
</head>  
<body>

<!-- header -->
<jsp:include page="header.jsp" />

<h1>Order History</h1>

<table>
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Date</th>
            <th>Total</th>
            <th>Items</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty orders}">
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.totalPrice}</td>
                    <td>
                        <ul class="item-list">
                            <c:forEach var="item" items="${order.items}">
                                <li>${item.foodName} (Quantity: ${item.quantity})</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
    </tbody>
</table>

<jsp:include page="footer.jsp" />

</body>
</html>
