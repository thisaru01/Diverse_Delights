package food_item_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class FoodItemEditServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("image_url");

        FoodItemDAO foodItemDAO = new FoodItemDAO();
        try {
            foodItemDAO.updateFoodItem(new FoodItem(id, name, category, price, description, imageUrl, null));
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("main.jsp?action=manageItems");
    }
}
