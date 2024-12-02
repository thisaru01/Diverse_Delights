package order_management;

public class BaseOrderItem {
    protected int id;  
    protected int quantity; // Relevant for OrderItem
    protected double price; // Relevant for OrderItem

    public BaseOrderItem(int id, int quantity, double price) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and Setters
    public int getId() { 
    	return id; 
    }
    
    public void setId(int id) { 
    	this.id = id; 
    }
    
    public int getQuantity() { 
    	return quantity; 
    }
    
    public void setQuantity(int quantity) { 
    	this.quantity = quantity; 
    }
    
    public double getPrice() { 
    	return price; 
    }
    
    public void setPrice(double price) { 
    	this.price = price;
    }
}
