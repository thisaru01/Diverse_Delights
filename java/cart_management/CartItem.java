package cart_management;

public class CartItem {
    private int id;
    private int foodItemId;
    private int userId;
    private int quantity;
    private String name;
    private double price;
    private String imageUrl;

    public CartItem(int id, int foodItemId, int userId, int quantity, String name, double price, String imageUrl) {
        this.id = id;
        this.foodItemId = foodItemId;
        this.userId = userId;
        this.quantity = quantity;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFoodItemId() {
        return foodItemId;
    }

  

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public double getTotalPrice() {
        return quantity * price;
    }
}

