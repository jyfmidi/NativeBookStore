<%@ page language="java" 
import="java.util.*,entity.Book,entity.User,javax.servlet.http.HttpSession" 
pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
HttpSession se=request.getSession();
User user=(User)session.getAttribute("user");
boolean isLogin=false;
if(user!=null){
isLogin=true;
}
String error = request.getParameter("error");
String success = request.getParameter("success");
String username = request.getParameter("username");
if(success!=null){
se.setAttribute("user", null);
isLogin=false;
}
if("logout".equals(error)){
isLogin=false;
se.setAttribute("user", null);
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/myaccount.css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div id="content">
		<div id="content-left">
			<div class="gray"> My Account
			</div>
			<%
				if (!isLogin) {
			%>
			  <div id="loginlogin">
                <form action="LoginServlet" method="post">
                <%
						if (error != null) {
								if (error.equals("usrorpwdwrong")) {
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Invalid username or password!</div>");
								}
							}
						if(success != null){
							if(success.equals("userregister"))
							{
							out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:blue;'>Registration Succeed! Welcome,"+username+",Please log in~</div>");
							}
						}
					%>
                    <div class="login_title">Login</div>
                    <div class="row1">
                        <label>username</label>&nbsp;
                        <input name="username">
                    </div>
                    <div class="row2">
                        <label>password:</label>&nbsp;
                        <input type="password" name="password">
                    </div>
                    <div class="row3">
                        <input type="checkbox" name="remember">Remember me</input>
                    </div>
                    <div class="row4">
                        <input type="submit" value="Login">
                    </div>
                </form>
            </div>
			<%
				} else {
			%>
			 <div id="myaccount">
                <div class="item">
                    <div class="box_top"></div>
                    <div class="box_center">
                        <table>
                            <tr>
                                <td class="left">My Account:</td>
                                <td>
                                    <span class="username"><%=user.getUsername() %></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">True name:</td>
                                <td><%=user.getTruename() %></td>
                            </tr>
                            <tr>
                                <td class="left">Email:</td>
                                <td><%=user.getEmail() %></td>
                            </tr>
                            <tr>
                                <td class="left">Phone number:</td>
                                <td><%=user.getPhone() %></td>
                            </tr>
                            <tr>
                                <td class="left">Address:</td>
                                <td><%=user.getAddress_() %></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="imgtd">
                                    <hr>
                                    <hr>
                                </td>
                            </tr>
                            <tr>
                                <td>User rank:</td>
                               <%if(user.getUsername().equals("admin")){
                                %>
                                <td>Administrator</td>
                                <%}else{ %>
                                <td>Customer</td>
                                <%} %>
                            </tr>
                        </table>
                    </div>
                    <div class="box_bottom"></div>
                </div>

            </div>
			<%
				}
			%>
		</div>
	</div>
</body>

</html>

