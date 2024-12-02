package food_item_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class FoodItemDeleteServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        FoodItemDAO foodItemDAO = new FoodItemDAO();
        try {
            foodItemDAO.deleteFoodItem(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("main.jsp?action=manageItems");
    }
}
