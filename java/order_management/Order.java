package order_management;

import java.sql.Timestamp;
import java.util.List;

public class Order extends BaseOrderItem {
    private int userId;
    private double totalPrice;
    private Timestamp orderDate;
    private List<OrderItem> items;

    public Order(int orderId, int userId, double totalPrice, Timestamp orderDate, List<OrderItem> items) {
        super(orderId, 0, totalPrice); // Using orderId as id, setting quantity to 0 for Order
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.items = items;
    }

    // Getters and Setters
    public int getUserId() { 
    	return userId; 
    }
    
    public void setUserId(int userId) {
    	this.userId = userId; 
    }
    
    public double getTotalPrice() { 
    	return totalPrice; 
    }
    
    public void setTotalPrice(double totalPrice) {
    	this.totalPrice = totalPrice; 
    }
    
    public Timestamp getOrderDate() {
    	return orderDate; 
    }
    
    public void setOrderDate(Timestamp orderDate) { 
    	this.orderDate = orderDate; 
    }
    
    public List<OrderItem> getItems() { 
    	return items; 
    }
    
    public void setItems(List<OrderItem> items) { 
    	this.items = items; 
    }
}
