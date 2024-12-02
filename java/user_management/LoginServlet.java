package user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
	
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.authenticateUser(email, password);

        if (user != null) {
            // Login successful, set user in session
            HttpSession session = request.getSession();
            session.setAttribute("user_id", user.getId());
            session.setAttribute("user_name", user.getName());
            response.sendRedirect("home.jsp"); // Redirect to the menu or home page
        } else {
            // Login failed, redirect back to login page
            response.sendRedirect("login.jsp?error=Invalid email or password");
        }
    }
}
