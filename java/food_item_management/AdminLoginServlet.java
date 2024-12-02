package food_item_management;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;



public class AdminLoginServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	private AdminDAO adminDAO;

    public void init() {
        adminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminDAO.getAdminByUsername(username);

        if (admin != null && admin.getPassword().equals(password)) {  
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);
            response.sendRedirect("main.jsp?action=manageItems");
        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid username or password");
        }
    }
}
