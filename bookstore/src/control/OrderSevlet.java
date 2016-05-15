package control;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Date;

import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Book;
import entity.User;
import entity.CartHandler;
import entity.OrderHandler;

public class OrderSevlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ArrayList<Book> cart = (ArrayList<Book>)session.getAttribute("cart");
		ArrayList<Integer> bookNums = (ArrayList<Integer>)session.getAttribute("bookNums");
		if (cart.isEmpty()||bookNums.isEmpty()) {
			request.getRequestDispatcher("cart.jsp?error=noitem").forward(request, response);
			return;
		}
		User user=(User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("cart", null);
			request.setAttribute("bookNums",null);
			session.setAttribute("cartHandler", null);
			request.getRequestDispatcher("cart.jsp?error=notlogin").forward(request, response);
			return;	
		}
		String username=user.getUsername();		
		
		OrderHandler orderHandler=new OrderHandler();
		for(int i = 0;i < cart.size();i++){
			Book tbook=cart.get(i);
			Integer tcount=bookNums.get(i);
			orderHandler.add(username, tbook.getBookid(), tcount, "paid");			
		}
		request.setAttribute("cart", null);
		request.setAttribute("bookNums",null);
		session.setAttribute("cartHandler", null);
		request.getRequestDispatcher("cart.jsp?success=checkout").forward(request, response);
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