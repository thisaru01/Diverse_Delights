package user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User newUser = new User(0, name, email, password, phone, address);
        UserDAO userDAO = new UserDAO();
        
        boolean success = userDAO.registerUser(newUser);

        if (success) {
            response.sendRedirect("login.jsp"); // Redirect to login after successful registration
        } else {
            response.sendRedirect("register.jsp?error=Email already exists");
        }
    }
}
