package cart_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ViewCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // User verification
        if (request.getSession().getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get user ID from session
        int userId = (Integer) request.getSession().getAttribute("user_id");

        // Retrieve cart items for this user
        CartDAO cartDAO = new CartDAO();
        List<CartItem> cartItems = cartDAO.viewCartByUser(userId);

        // Set cart items as request attribute and forward to cart.jsp
        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }
}
