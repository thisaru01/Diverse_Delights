package order_management;

import cart_management.CartItem;
import cart_management.CartDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class PlaceOrderServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = (Integer) request.getSession().getAttribute("user_id");

        // Fetch cart items
        CartDAO cartDAO = new CartDAO();
        List<CartItem> cartItems = cartDAO.viewCartByUser(userId);

        // Calculate total price
        double totalPrice = 0;
        for (CartItem item : cartItems) {
            totalPrice += item.getTotalPrice();
        }

        // Place order using OrderDAO
        OrderDAO orderDAO = new OrderDAOImpl();
        orderDAO.placeOrder(userId, cartItems, totalPrice);

        // Clear cart after placing the order
        cartDAO.clearCart(userId);

        // Redirect to order history page
        response.sendRedirect("ViewOrderHistoryServlet");
    }
}
