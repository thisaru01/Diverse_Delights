package order_management;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewOrderHistoryServlet")
public class ViewOrderHistoryServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = (Integer) request.getSession().getAttribute("user_id");

        OrderDAO orderDAO = new OrderDAOImpl();
        List<Order> orders = orderDAO.viewOrderHistory(userId);

        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("orderHistory.jsp");
        dispatcher.forward(request, response);
    }
}
