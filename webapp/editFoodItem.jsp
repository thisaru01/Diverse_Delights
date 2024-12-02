<%@ page import="food_item_management.FoodItem, food_item_management.FoodItemDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    FoodItemDAO dao = new FoodItemDAO();
    FoodItem item = dao.selectFoodItemById(id);
%>

<div class="main-content">
    <h2 class="mb-4 text-center">Edit Food Item</h2>
    <div class="form-container">
        <form action="editFoodItem" method="post" class="form">
            <input type="hidden" name="id" value="<%= item.getId() %>">
            
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= item.getName() %>" required>
            </div>
            
            <div class="form-group">
                <label for="category">Category:</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="Appetizers" <%= item.getCategory().equals("Appetizers") ? "selected" : "" %>>Appetizers</option>
                    <option value="Main Course" <%= item.getCategory().equals("Main Course") ? "selected" : "" %>>Main Course</option>
                    <option value="Desserts" <%= item.getCategory().equals("Desserts") ? "selected" : "" %>>Desserts</option>
                    <option value="Beverages" <%= item.getCategory().equals("Beverages") ? "selected" : "" %>>Beverages</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" name="price" step="0.01" value="<%= item.getPrice() %>" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4" required><%= item.getDescription() %></textarea>
            </div>
            
            <div class="form-group">
                <label for="image_url">Image URL:</label>
                <input type="url" class="form-control" id="image_url" name="image_url" value="<%= item.getImageUrl() %>">
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn-sub">Update Item</button>
            </div>
        </form>
    </div>
</div>


