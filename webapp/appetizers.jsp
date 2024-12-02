<%@ page import="java.util.List" %>
<%@ page import="food_item_management.FoodItem" %>
<%@ page import="food_item_management.FoodItemDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    FoodItemDAO dao = new FoodItemDAO();
    List<FoodItem> appetizers = dao.selectFoodItemsByCategory("Appetizers");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap CSS only for the sidebar -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS for additional styling -->
    <link rel="stylesheet" href="css/category.css">
    <title>Appetizers</title>
    
     <script>
	 	function validateQuantity(form) {
	        const quantityInput = form.quantity;
	        const quantityValue = parseInt(quantityInput.value);
	
	        if (quantityValue > 99) {
	            alert("Quantity cannot exceed 99.");
	            quantityInput.focus();
	            return false; // Prevent form submission
	        }
	
	        return true; // Allow form submission
	    }
    </script> 
    
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar for Categories -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar">
            <h4>Menu</h4>
            <a href="appetizers.jsp" class="active">Appetizers</a>
            <a href="beverages.jsp">Beverages</a>
            <a href="mainCourse.jsp">Main Course</a>
            <a href="desserts.jsp">Desserts</a>
        </nav>

        <!-- Main content area for the menu -->
        <main class="col-md-9 col-lg-10 menu-items">
            <h2>Appetizers Menu</h2>

            <div class="menu-card-container">
                <%
                    if (appetizers != null && !appetizers.isEmpty()) {
                        for (FoodItem item : appetizers) {
                %>
                <!-- Single menu item card -->
                <div class="menu-card">
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>" class="menu-card-img">
                    <div class="menu-card-body">
                        <h5 class="menu-card-title"><%= item.getName() %></h5>
                        <p class="menu-card-text" style="font-weight: bold; font-size: 14px;">Rs<%= item.getPrice() %></p>

                        <p class="menu-card-text"><%= item.getDescription() %></p>
                        
                        <!-- Add to Cart form -->
                        <form action="AddToCartServlet" method="post" class="menu-card-form" onsubmit="return validateQuantity(this)">
                            <input type="hidden" name="food_item_id" value="<%= item.getId() %>">
                            <input type="number" name="quantity" value="1" min="1" class="quantity-input">
                            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
                        </form>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="no-items-message">
                    <p>No appetizers available.</p>
                </div>
                <%
                    }
                %>
            </div>
        </main>
    </div>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
