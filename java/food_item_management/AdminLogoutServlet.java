package food_item_management;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;


public class AdminLogoutServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the current session if it exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Redirect the admin to the login page after logout
        response.sendRedirect("adminLogin.jsp?message=You have been logged out successfully");
    }
}
