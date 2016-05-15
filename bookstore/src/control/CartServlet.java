package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.CartHandler;
import entity.Book;

public class CartServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		CartHandler cartHandler = (CartHandler) session.getAttribute("cartHandler");
		if (cartHandler == null) {
			cartHandler = new CartHandler();
			request.getSession().setAttribute("cartHandler", cartHandler);
		}
		if (id != null)
		{
			if ("del".equals(action)) {
				cartHandler.removeBookById(id);
			} else if ("add".equals(action)) {
				cartHandler.AddBook1QuantityById(id);
			} else if ("sub".equals(action)) {
				cartHandler.SubBook1QuantityById(id);
			} else
			{
				cartHandler.addNewBook(id, "1");
			}
		}
		ArrayList<Book> cart = cartHandler.getBook();
		ArrayList<Integer> book = new ArrayList<Integer>();
		for(int i = 0;i < cart.size();i++)
			book.add(Integer.parseInt(cartHandler.getBookCountById(cart.get(i).getBookid()+"")));
		request.setAttribute("cart", cart);
		request.setAttribute("bookNums",book);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
