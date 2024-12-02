package order_management;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AdminViewOrdersServlet")

public class AdminViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAOImpl();
        List<AdminOrderView> orders = orderDAO.getAllOrders();
        
        // Check if the request is an AJAX request
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<table class='table table-bordered'>");
            out.println("<thead><tr><th>Order ID</th><th>User Name</th><th>User Address</th><th>User Phone</th><th>Item IDs</th><th>Order Time</th><th>Total Price</th></tr></thead>");
            out.println("<tbody>");
            for (AdminOrderView order : orders) {
                out.println("<tr>");
                out.println("<td>" + order.getOrderId() + "</td>");
                out.println("<td>" + order.getUserName() + "</td>");
                out.println("<td>" + order.getUserAddress() + "</td>");
                out.println("<td>" + order.getUserPhone() + "</td>");
                out.println("<td>" + order.getItemIds() + "</td>");
                out.println("<td>" + order.getOrderDate() + "</td>");
                out.println("<td>" + order.getTotalPrice() + "</td>");
                out.println("</tr>");
            }
            out.println("</tbody></table>");
            return;
        }

        // Regular request handling (if needed)
        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminOrderHistory.jsp");
        dispatcher.forward(request, response);
    }
}


