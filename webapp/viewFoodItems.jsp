<%@ page import="java.util.List, food_item_management.FoodItem, food_item_management.FoodItemDAO" %>
<%
    FoodItemDAO dao = new FoodItemDAO();
    List<FoodItem> foodItems = dao.selectAllFoodItems();
%>

 <h1>Food Items</h1>
 <div class="main-content" id="mainContent">
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
