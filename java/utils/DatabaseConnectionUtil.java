package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionUtil {
    
    // Database connection details
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/diverse_delights";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "bigfilth";

    // Establish connection to the database
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
