package cart_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RemoveFromCartServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // User verification
	    if (request.getSession().getAttribute("user_id") == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    int userId = (Integer) request.getSession().getAttribute("user_id");
	    String foodItemIdParam = request.getParameter("food_item_id");

	    // Debugging output
	    System.out.println("User ID: " + userId);
	    System.out.println("Food Item ID: " + foodItemIdParam);

	    // Check if foodItemIdParam is valid
	    if (foodItemIdParam != null && !foodItemIdParam.isEmpty()) {
	        try {
	            int foodItemId = Integer.parseInt(foodItemIdParam);
	            CartDAO cartDAO = new CartDAO();
	            cartDAO.removeCartItem(userId, foodItemId);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
	    response.sendRedirect("ViewCartServlet");
	}

}
