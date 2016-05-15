<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/content.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/index.css">
</head>
  
  <body>
	<div id="header">
	<h1 class="center">
	Naive Book Store
	</h1>
	<p class="center">		
		Welcome to the administrator page
	</p>
	<div id="menu">
		<ul>
			<li><a href="addBook.jsp"<% if(request.getRequestURI().contains("addBook.jsp")){ %>class="selected"<% } %>>add Book</a></li>
			<li><a href="manageBook_header.jsp"<% if(request.getRequestURI().contains("manageBook_header.jsp")){ %>class="selected"<% } %>>Book management</a></li>
			<li><a href="manageUser_header.jsp"<% if(request.getRequestURI().contains("manageUser_header.jsp")){ %>class="selected"<% } %>>User management</a></li>
			<li><a href="manageOrder.jsp"<% if(request.getRequestURI().contains("manageOrder.jsp")){ %>class="selected"<% } %>>Order management</a></li>
		</ul>
<div class="welcome">Welcome administrator
	<br>
		<a href="account.jsp?error=logout">Logout</a> 
		<a href="index.jsp">Return</a>
	</div>	</div>

  </body>
</html>
