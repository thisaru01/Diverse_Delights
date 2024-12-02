package feedback_management;

import utils.DatabaseConnectionUtil; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    //add feedback
	
    public void addFeedback(Feedback feedback) throws SQLException {
        String sql = "INSERT INTO feedback (user_id, feedback_text) VALUES (?, ?)";
        try (Connection conn = DatabaseConnectionUtil.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, feedback.getUserId());
            stmt.setString(2, feedback.getFeedbackText());
            stmt.executeUpdate();
        }
    }

    //retrieve feedback
    
    public List<Feedback> getFeedbackByUserId(int userId) {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback WHERE user_id = ?";
        try (Connection conn = DatabaseConnectionUtil.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setFeedbackText(rs.getString("feedback_text"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return feedbackList;
    }

    //update feedback
    
    public void updateFeedback(int feedbackId, String feedbackText) throws SQLException {
        String sql = "UPDATE feedback SET feedback_text = ? WHERE id = ?";
        try (Connection conn = DatabaseConnectionUtil.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feedbackText);
            stmt.setInt(2, feedbackId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //delete feedback
    
    public void deleteFeedback(int feedbackId) throws SQLException {
        String sql = "DELETE FROM feedback WHERE id = ?";
        try (Connection conn = DatabaseConnectionUtil.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, feedbackId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //retrieve all feedback
    
    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT f.id, u.name as username, f.feedback_text, f.created_at " +
                     "FROM feedback f " +
                     "JOIN users u ON f.user_id = u.id";
        try (Connection conn = DatabaseConnectionUtil.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setFeedbackText(rs.getString("feedback_text"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedback.setUsername(rs.getString("username"));  
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return feedbackList;
    }
}
