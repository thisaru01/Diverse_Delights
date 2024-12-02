package food_item_management;

import java.sql.SQLException;
import java.util.List;

public interface FoodItemInterface {
    void insertFoodItem(FoodItem foodItem) throws SQLException;
    List<FoodItem> selectAllFoodItems();
    FoodItem selectFoodItemById(int id);
    List<FoodItem> selectFoodItemsByCategory(String category);
    void updateFoodItem(FoodItem foodItem) throws SQLException;
    void deleteFoodItem(int id) throws SQLException;
}
