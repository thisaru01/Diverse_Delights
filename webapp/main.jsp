<%@ page session="false" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;}
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
   
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Admin</h2>
            <ul class="nav">
                <li><a href="#" onclick="loadContent('addFoodItem.jsp')">Add Items</a></li>
                <li><a href="#" onclick="loadContent('AdminViewOrdersServlet')">Orders</a></li>
                <li><a href="#" onclick="loadContent('viewFoodItems.jsp')">Manage Items</a></li>
                <li><a href="javascript:void(0);" onclick="confirmLogout()">Logout</a></li>
            </ul>
        </div>
        
        <div class="main-content" id="mainContent">
          
            
        <%@ page import="java.util.List, food_item_management.FoodItem, food_item_management.FoodItemDAO" %>
		<%
		    FoodItemDAO dao = new FoodItemDAO();
		    List<FoodItem> foodItems = dao.selectAllFoodItems();
		%>
		
		 <h1>Food Items</h1>
		 <div class="container" >
		        <table class="table">
		            <thead>
		                <tr>
		                    <th>ID</th>
		                    <th>Name</th>
		                    <th>Category</th>
		                    <th>Price</th>
		                    <th>Description</th>
		                    <th>Image</th>
		                    <th>Actions</th>
		                </tr>
		            </thead>
		            <tbody>
		                <% for (FoodItem item : foodItems) { %>
		                    <tr>
		                        <td><%= item.getId() %></td>
		                        <td><%= item.getName() %></td>
		                        <td><%= item.getCategory() %></td>
		                        <td>Rs <%= item.getPrice() %></td>
		                        <td><%= item.getDescription() %></td>
		                        <td>
		                            <img src="<%= item.getImageUrl() %>" alt="Image" class="thumbnail">
		                        </td>
		                        <td class="text-center">
		                            <button onclick="loadContent('editFoodItem.jsp?id=<%= item.getId() %>')">Edit</button>
		                            
		                            <form action="deleteFoodItem" method="post" style="display:inline;" onsubmit="return confirmDelete();">
		                                <input type="hidden" name="id" value="<%= item.getId() %>">
		                                <button type="submit" >Delete</button>
		                            </form>
		                        </td>
		                    </tr>
		                <% } %>
		            </tbody>
		        </table>
		    </div>
		            
		        </div>
		    </div>

    <script src="js/scripts.js"></script>
</body>
</html>
