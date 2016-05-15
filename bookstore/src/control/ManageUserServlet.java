package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.UserHandler;

public class ManageUserServlet extends HttpServlet {

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
		String userid_s = request.getParameter("userid");
		long userid=Long.parseLong(userid_s);
		UserHandler userHandler=new UserHandler();
		userHandler.remove(userid);
		
		String act=request.getParameter("M");
		if(act==null) {
			request.getRequestDispatcher("manageUser_header.jsp").forward(request, response);
			}
		else{
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String truename = request.getParameter("truename");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			String address = request.getParameter("address");
		
			
			if (userHandler.isUserNameExist(username)||userHandler.isUserExist(userid)) {
				request.getRequestDispatcher("manageUser_header.jsp?error=useridexist").forward(request, response);
			} else {
				if (userHandler.register(username, password,truename,email,phonenumber,address)) {
					request.getRequestDispatcher("manageUser_header.jsp").forward(request, response);
				} else {
						request.getRequestDispatcher("manageUser_header.jsp?error=registererror").forward(request, response);
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
