package order_management;

import utils.DatabaseConnectionUtil;
import cart_management.CartItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {

    private static final String INSERT_ORDER_SQL = "INSERT INTO orders (user_id, total_price) VALUES (?, ?)";
    private static final String INSERT_ORDER_ITEM_SQL = "INSERT INTO order_items (order_id, food_item_id, quantity, price) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ORDER_HISTORY_SQL = "SELECT * FROM orders WHERE user_id = ?";
    private static final String SELECT_ORDER_ITEMS_SQL = "SELECT oi.*, f.name FROM order_items oi JOIN food_items f ON oi.food_item_id = f.id WHERE oi.order_id = ?";

    @Override
    public void placeOrder(int userId, List<CartItem> cartItems, double totalPrice) {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement orderStatement = connection.prepareStatement(INSERT_ORDER_SQL, Statement.RETURN_GENERATED_KEYS)) {

            // Insert into orders table
            orderStatement.setInt(1, userId);
            orderStatement.setDouble(2, totalPrice);
            orderStatement.executeUpdate();

            // Get the generated order ID
            ResultSet generatedKeys = orderStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int orderId = generatedKeys.getInt(1);

                // Insert each item into order_items table
                try (PreparedStatement orderItemStatement = connection.prepareStatement(INSERT_ORDER_ITEM_SQL)) {
                    for (CartItem item : cartItems) {
                        orderItemStatement.setInt(1, orderId);
                        orderItemStatement.setInt(2, item.getFoodItemId());
                        orderItemStatement.setInt(3, item.getQuantity());
                        orderItemStatement.setDouble(4, item.getPrice());
                        orderItemStatement.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> viewOrderHistory(int userId) {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_HISTORY_SQL)) {

            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                double totalPrice = resultSet.getDouble("total_price");
                Timestamp orderDate = resultSet.getTimestamp("order_date");

                // Fetch order items for each order
                List<OrderItem> orderItems = fetchOrderItems(orderId);
                orders.add(new Order(orderId, userId, totalPrice, orderDate, orderItems));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    private List<OrderItem> fetchOrderItems(int orderId) {
        List<OrderItem> orderItems = new ArrayList<>();
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_ITEMS_SQL)) {

            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int itemId = resultSet.getInt("food_item_id");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                String itemName = resultSet.getString("name");

                orderItems.add(new OrderItem(itemId, quantity, price, itemName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }
    
    public List<AdminOrderView> getAllOrders() {
        List<AdminOrderView> orderList = new ArrayList<>();
        String query = "SELECT o.id as order_id, o.user_id, o.total_price, o.order_date, " +
                       "u.name as user_name, u.address as user_address, u.phone as user_phone, " +
                       "GROUP_CONCAT(oi.food_item_id) as item_ids " +
                       "FROM orders o " +
                       "JOIN users u ON o.user_id = u.id " +
                       "JOIN order_items oi ON o.id = oi.order_id " +
                       "GROUP BY o.id";

        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                int userId = resultSet.getInt("user_id");
                double totalPrice = resultSet.getDouble("total_price");
                Timestamp orderDate = resultSet.getTimestamp("order_date");
                String userName = resultSet.getString("user_name");
                String userAddress = resultSet.getString("user_address");
                String userPhone = resultSet.getString("user_phone");
                String itemIds = resultSet.getString("item_ids");

                AdminOrderView order = new AdminOrderView(orderId, userId, totalPrice, orderDate, userName, userAddress, userPhone, itemIds);
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
}
