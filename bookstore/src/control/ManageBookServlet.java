package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.BookHandler;

public class ManageBookServlet extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String bookid_s = request.getParameter("bookid");
		long bookid=Long.parseLong(bookid_s);
		BookHandler bookHandler=new BookHandler();
		bookHandler.remove(bookid);
		
		String act=request.getParameter("M");
		if(act==null) {
			request.getRequestDispatcher("manageBook_header.jsp").forward(request, response);
			}
		else{
			String bookname = request.getParameter("bookname");
			String brief = request.getParameter("brief");
			String detail = request.getParameter("detail");
			String price_s = request.getParameter("price");
			float price=Float.parseFloat(price_s);
			String photo = request.getParameter("photo");
			String category = request.getParameter("category");
			if (bookHandler.isBookNameExist(bookname)) {
				request.getRequestDispatcher("manageBook_header.jsp?error=usernameexist").forward(request, response);
			} else {
				if (bookHandler.add(bookid,bookname,brief,detail,price,photo,category)) {
					request.getRequestDispatcher("manageBook_header.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("manageBook_header.jsp?error=registererror").forward(request, response);
				}
			}
		}

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
