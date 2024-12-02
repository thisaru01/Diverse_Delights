package food_item_management;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.DatabaseConnectionUtil;

public class FoodItemDAO implements FoodItemInterface {

    // SQL Queries
    private static final String INSERT_FOOD_ITEM_SQL = "INSERT INTO food_items (name, category, price, description, image_url) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_FOOD_ITEMS_SQL = "SELECT * FROM food_items";
    private static final String SELECT_FOOD_ITEM_BY_ID_SQL = "SELECT * FROM food_items WHERE id = ?";
    private static final String SELECT_FOOD_ITEMS_BY_CATEGORY_SQL = "SELECT * FROM food_items WHERE category = ?";
    private static final String UPDATE_FOOD_ITEM_SQL = "UPDATE food_items SET name = ?, category = ?, price = ?, description = ?, image_url = ? WHERE id = ?";
    private static final String DELETE_FOOD_ITEM_SQL = "DELETE FROM food_items WHERE id = ?";

    // Insert a new food item
    @Override
    public void insertFoodItem(FoodItem foodItem) throws SQLException {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FOOD_ITEM_SQL)) {

            preparedStatement.setString(1, foodItem.getName());
            preparedStatement.setString(2, foodItem.getCategory());
            preparedStatement.setDouble(3, foodItem.getPrice());
            preparedStatement.setString(4, foodItem.getDescription());
            preparedStatement.setString(5, foodItem.getImageUrl());

            preparedStatement.executeUpdate();
        }
    }
    
    @Override
    public List<FoodItem> selectFoodItemsByCategory(String category) {
        List<FoodItem> foodItems = new ArrayList<>();
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FOOD_ITEMS_BY_CATEGORY_SQL)) {

            preparedStatement.setString(1, category);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                foodItems.add(mapRowToFoodItem(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    @Override
    public List<FoodItem> selectAllFoodItems() {
        List<FoodItem> foodItems = new ArrayList<>();
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FOOD_ITEMS_SQL)) {

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                foodItems.add(mapRowToFoodItem(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    @Override
    public FoodItem selectFoodItemById(int id) {
        FoodItem foodItem = null;
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FOOD_ITEM_BY_ID_SQL)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                foodItem = mapRowToFoodItem(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItem;
    }

    @Override
    public void updateFoodItem(FoodItem foodItem) throws SQLException {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FOOD_ITEM_SQL)) {

            preparedStatement.setString(1, foodItem.getName());
            preparedStatement.setString(2, foodItem.getCategory());
            preparedStatement.setDouble(3, foodItem.getPrice());
            preparedStatement.setString(4, foodItem.getDescription());
            preparedStatement.setString(5, foodItem.getImageUrl());
            preparedStatement.setInt(6, foodItem.getId());

            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void deleteFoodItem(int id) throws SQLException {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FOOD_ITEM_SQL)) {

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }

    
    private FoodItem mapRowToFoodItem(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String name = resultSet.getString("name");
        String category = resultSet.getString("category");
        double price = resultSet.getDouble("price");
        String description = resultSet.getString("description");
        String imageUrl = resultSet.getString("image_url");
        String createdAt = resultSet.getString("created_at");

        return new FoodItem(id, name, category, price, description, imageUrl, createdAt);
    }
}
