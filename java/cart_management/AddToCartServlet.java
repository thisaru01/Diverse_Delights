package cart_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddToCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // User verification: check if the user is logged in
        if (request.getSession().getAttribute("user_id") == null) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        // Get user ID from session
        int userId = (Integer) request.getSession().getAttribute("user_id");

        // Get food item ID from request
        int foodItemId = Integer.parseInt(request.getParameter("food_item_id"));

        // Get the quantity from the request and handle null or invalid input
        String quantityParam = request.getParameter("quantity");
        int quantity = 1; // Default value
        if (quantityParam != null) {
            try {
                quantity = Integer.parseInt(quantityParam);
            } catch (NumberFormatException e) {
                // Handle the error (e.g., log the error or set quantity to default)
                quantity = 1; // Fallback to a default value if parsing fails
            }
        }

        // Add item to cart (using CartDAO)
        CartDAO cartDAO = new CartDAO();
        cartDAO.addToCart(userId, foodItemId, quantity);

        // Redirect to view cart page
        response.sendRedirect("ViewCartServlet");
    }
}
