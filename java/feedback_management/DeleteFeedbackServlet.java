package feedback_management;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteFeedbackServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        try {
            feedbackDAO.deleteFeedback(feedbackId);
            response.sendRedirect("ViewFeedbackServlet"); 
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error while deleting feedback.");
            request.getRequestDispatcher("feedbackView.jsp").forward(request, response);
        }
    }
}
