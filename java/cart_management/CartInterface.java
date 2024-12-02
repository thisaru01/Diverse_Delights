package cart_management;

import java.sql.SQLException;
import java.util.List;

public interface CartInterface {
    void addToCart(int userId, int foodItemId, int quantity) throws SQLException;
    List<CartItem> viewCartByUser(int userId) throws SQLException;
    void updateCartItem(int userId, int foodItemId, int quantity) throws SQLException;
    void removeCartItem(int userId, int foodItemId) throws SQLException;
    void clearCart(int userId) throws SQLException;
}
