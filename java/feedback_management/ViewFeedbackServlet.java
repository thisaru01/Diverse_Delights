package feedback_management;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class ViewFeedbackServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	private FeedbackDAO feedbackDAO;

    public void init() {
        feedbackDAO = new FeedbackDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            System.out.println("No user ID found in session. Redirecting to login page.");
            response.sendRedirect("login.jsp");
            return;
        }


        List<Feedback> feedbackList = feedbackDAO.getFeedbackByUserId(userId);
        
        request.setAttribute("feedbackList", feedbackList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("feedbackView.jsp");
        dispatcher.forward(request, response);
    }
}
