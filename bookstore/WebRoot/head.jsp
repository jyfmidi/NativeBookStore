<%@ page import="entity.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
  <%
    HttpSession session_ = request.getSession();
	User user = (User) session.getAttribute("user");
	boolean isLogin = true;
	if (user == null) {
		isLogin = false;
	}
	String success = request.getParameter("success");
	if(success != null)
	{
		session_.setAttribute("user", null);
		isLogin = false;
	}
	 %>
	<div id="header">
	<h1 class="center">
	Naive Book Store
	</h1>
	<p class="center">		
		Welcome to the naive book store
	</p>
		<div id="menu">
		<ul>
			<li><a href="index.jsp" <% if(request.getRequestURI().contains("index.jsp")){ %>class="selected"<% } %>>Main Page</a></li>
			<li><a href="books.jsp" <% if(request.getRequestURI().contains("books.jsp")){ %>class="selected"<% } %>>Book</a></li>
			<li><a href="account.jsp" <% if(request.getRequestURI().contains("account.jsp")){ %>class="selected"<% } %>>My Account</a></li>
			<li><a href="register.jsp" <% if(request.getRequestURI().contains("register.jsp")){ %>class="selected"<% } %>>Register</a></li>
			<%if(isLogin){
			%>
			<li><a href="orders.jsp" <% if(request.getRequestURI().contains("orders.jsp")){ %>class="selected"<% } %>>My orders</a></li>
			<%
			} %>
		</ul>
	</div>
	
	<%
		if (isLogin) {
	%>
	<div class="welcome"><a href="account.jsp">Welcome <%=user.getUsername()%></a>
	<br>
		<a href="account.jsp?error=logout">Logout</a>
		<%
		if(user.getUsername().equals("admin")){
		%> 
		<a href="manage.jsp">Management</a>
	</div>
	<%
		}
		else{
		%>
		<a href=#>Management</a>
	</div>
	<%
		}
		}
		 else {
	%>
	<div id="login">
		<form action="LoginServlet" method="post">
			<div>
				username: <input name="username">
			</div>
			<div>
				password: <input name="password" type="password">
			</div>
			<div id="log">
				<input type="submit" value="Login">
			</div>
		</form>
	</div>
	<%
		}
	%>
</div>
