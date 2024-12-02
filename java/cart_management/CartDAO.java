package cart_management;

import utils.DatabaseConnectionUtil; // Import the DatabaseConnectionUtil
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO implements CartInterface {

    // SQL Queries (Constants)
    private static final String ADD_ITEM_TO_CART_SQL = "INSERT INTO cart (user_id, food_item_id, quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantity = quantity + ?";
    private static final String VIEW_CART_BY_USER_SQL = "SELECT c.id, c.food_item_id, c.quantity, f.name, f.price, f.image_url FROM cart c JOIN food_items f ON c.food_item_id = f.id WHERE c.user_id = ?";
    private static final String UPDATE_CART_ITEM_SQL = "UPDATE cart SET quantity = ? WHERE user_id = ? AND food_item_id = ?";
    private static final String DELETE_CART_ITEM_SQL = "DELETE FROM cart WHERE user_id = ? AND food_item_id = ?";
    private static final String CLEAR_CART_SQL = "DELETE FROM cart WHERE user_id = ?";

    @Override
    public void addToCart(int userId, int foodItemId, int quantity) {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ITEM_TO_CART_SQL)) {

            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, foodItemId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setInt(4, quantity); // Use quantity twice for "ON DUPLICATE KEY UPDATE"

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally throw a runtime exception or handle the error as needed
            throw new RuntimeException("Error adding item to cart", e);
        }
    }

    @Override
    public List<CartItem> viewCartByUser(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VIEW_CART_BY_USER_SQL)) {

            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int foodItemId = resultSet.getInt("food_item_id");
                int quantity = resultSet.getInt("quantity");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String imageUrl = resultSet.getString("image_url");

                cartItems.add(new CartItem(id, foodItemId, userId, quantity, name, price, imageUrl));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally throw a runtime exception or handle the error as needed
            throw new RuntimeException("Error viewing cart for user ID: " + userId, e);
        }
        return cartItems;
    }

    @Override
    public void updateCartItem(int userId, int foodItemId, int quantity) {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_ITEM_SQL)) {

            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, foodItemId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally throw a runtime exception or handle the error as needed
            throw new RuntimeException("Error updating cart item", e);
        }
    }

    @Override
    public void removeCartItem(int userId, int foodItemId) {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_ITEM_SQL)) {

            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, foodItemId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally throw a runtime exception or handle the error as needed
            throw new RuntimeException("Error removing cart item", e);
        }
    }

    @Override
    public void clearCart(int userId) {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CLEAR_CART_SQL)) {

            preparedStatement.setInt(1, userId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally throw a runtime exception or handle the error as needed
            throw new RuntimeException("Error clearing cart for user ID: " + userId, e);
        }
    }
}
