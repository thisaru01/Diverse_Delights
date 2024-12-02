package food_item_management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DatabaseConnectionUtil; // Import the DatabaseConnectionUtil

public class AdminDAO {

    public Admin getAdminByUsername(String username) {
        Admin admin = null;
        String query = "SELECT * FROM admins WHERE username = ?";
        try (Connection connection = DatabaseConnectionUtil.getConnection(); // Use DatabaseConnectionUtil for connection
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                // Use the constructor that takes ID, username, and password
                admin = new Admin(
                    resultSet.getInt("id"), // Get ID from the result set
                    resultSet.getString("username"),
                    resultSet.getString("password") // Ensure to hash passwords when storing
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
