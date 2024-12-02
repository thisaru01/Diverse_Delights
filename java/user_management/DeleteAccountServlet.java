package user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteAccountServlet extends HttpServlet {
    
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user ID from session or request
        HttpSession session = request.getSession(false);
        if (session != null) {
            Integer userId = (Integer) session.getAttribute("user_id"); // Get user ID from session
            
            if (userId != null) {
                UserDAO userDAO = new UserDAO();
                boolean success = userDAO.deleteUser(userId); // Call the deleteUser method

                if (success) {
                    session.invalidate(); // Invalidate session after deletion
                    response.sendRedirect("register.jsp?message=Account deleted successfully."); // Redirect to registration page or home
                } else {
                    response.sendRedirect("editProfile.jsp?error=Deletion failed."); // Redirect back to profile page with error
                }
            } else {
                response.sendRedirect("login.jsp"); // Redirect to login if user ID is not found
            }
        } else {
            response.sendRedirect("login.jsp"); // Redirect to login if session is not valid
        }
    }
}
