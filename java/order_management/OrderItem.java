package order_management;

public class OrderItem extends BaseOrderItem {
    private String foodName;

    public OrderItem(int foodItemId, int quantity, double price, String foodName) {
        super(foodItemId, quantity, price); // Call to the base class constructor
        this.foodName = foodName;
    }

    // Getters and Setters
    public String getFoodName() { 
    	return foodName; 
    }
    
    public void setFoodName(String foodName) { 
    	this.foodName = foodName; 
    }
}
