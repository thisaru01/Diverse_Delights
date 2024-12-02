package food_item_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class FoodItemSubmitServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	

    	
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("image_url");

        FoodItemDAO foodItemDAO = new FoodItemDAO();
        try {
            foodItemDAO.insertFoodItem(new FoodItem(name, category, price, description, imageUrl));
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("main.jsp?action=manageItems");
    }
}
