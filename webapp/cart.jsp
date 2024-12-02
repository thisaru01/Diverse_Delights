<%@ page import="cart_management.CartItem" %>
<%@ page import="java.util.List" %>
<%
    @SuppressWarnings("unchecked")
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    double totalAmount = 0.0;
    
    // Retrieve user information from session
    Integer userId = (Integer) request.getSession().getAttribute("user_id");
    String userName = (String) request.getSession().getAttribute("user_name");
    String userAddress = (String) request.getSession().getAttribute("user_address");
    String userPhone = (String) request.getSession().getAttribute("user_phone");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>

<div id="cartModal" class="cart-popup">
    <div class="popup-content">
        <span class="close-button">&times;</span>
        <h2>Your Cart</h2>
        <div class="table-container">
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (cartItems != null && !cartItems.isEmpty()) {
                            for (CartItem item : cartItems) {
                                totalAmount += item.getTotalPrice();
                    %>
                    <tr>
                        <td><img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>" class="item-image"></td>
                        <td><%= item.getName() %></td>
                        <td>Rs <%= String.format("%.2f", item.getPrice()) %></td>
                        <td>
                            <form action="UpdateCartItemServlet" method="post" onsubmit="return validateQuantity(this)">
                                <input type="hidden" name="food_item_id" value="<%= item.getFoodItemId() %>">
                                <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" required>
                                <button type="submit" class="update-button">Update</button>
                            </form>
                        </td>
                        <td>Rs <%= String.format("%.2f", item.getTotalPrice()) %></td>
                        <td>
                            <form action="RemoveFromCartServlet" method="post">
                                <input type="hidden" name="food_item_id" value="<%= item.getFoodItemId() %>">
                                <button type="submit" class="remove-button">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="empty-message">Your cart is empty.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="total-section">
            <h4>Total Amount: Rs <%= String.format("%.2f", totalAmount) %></h4>
            <form action="PlaceOrderServlet" method="post">
                <input type="hidden" name="user_id" value="<%= userId %>">
                <input type="hidden" name="user_name" value="<%= userName %>">
                <input type="hidden" name="address" value="<%= userAddress %>">
                <input type="hidden" name="phone" value="<%= userPhone %>">
                <input type="hidden" name="total_amount" value="<%= totalAmount %>">
                <button type="submit" class="place-order-button">Place Order</button>
            </form>
        </div>
        <div class="continue-shopping">
            <a href="appetizers.jsp" class="continue-button">Continue Shopping</a>
        </div>
    </div>
</div>

<script src="js/cart.js"></script>
</body>
</html>
