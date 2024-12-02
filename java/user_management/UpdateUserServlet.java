package user_management;

import javax.servlet.*;

import javax.servlet.http.*;
import java.io.IOException;

public class UpdateUserServlet extends HttpServlet {
    
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User updatedUser = new User(id, name, email, null, phone, address);
        UserDAO userDAO = new UserDAO();

        boolean success = userDAO.updateUser(updatedUser);

        if (success) {
            response.sendRedirect("editProfile.jsp"); // Redirect after successful update
        } else {
            response.sendRedirect("editProfile.jsp?error=Update failed");
        }
    }
}
