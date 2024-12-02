package order_management;

import java.util.List;

import cart_management.CartItem;

public interface OrderDAO {
    void placeOrder(int userId, List<CartItem> cartItems, double totalPrice);
    List<Order> viewOrderHistory(int userId);
    List<AdminOrderView> getAllOrders();
}
