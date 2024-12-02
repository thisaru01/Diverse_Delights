package cart_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateCartItemServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // User verification
        if (request.getSession().getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) request.getSession().getAttribute("user_id");
        int foodItemId = Integer.parseInt(request.getParameter("food_item_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Update the cart item
        CartDAO cartDAO = new CartDAO();
        cartDAO.updateCartItem(userId, foodItemId, quantity);

        // Redirect back to the cart
        response.sendRedirect("ViewCartServlet");
    }
}
