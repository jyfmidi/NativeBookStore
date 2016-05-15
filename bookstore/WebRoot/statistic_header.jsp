<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String error = request.getParameter("error");
	session.setAttribute("book", null);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<jsp:include page="manage.jsp"></jsp:include>
	<div class="gray">
    Order Statistics
	</div>
	<div id="menu">
		<ul>
			<li><a href="manageOrder.jsp"<% if(request.getRequestURI().contains("manageOrder.jsp")){ %>class="selected"<% } %>>All orders</a></li>
			<li><a href="statisticCategory.jsp"<% if(request.getRequestURI().contains("statisticCategory.jsp")){ %>class="selected"<% } %>>Category statistics</a></li>
			<li><a href="statisticYearMonth.jsp"<% if(request.getRequestURI().contains("statisticYearMonth.jsp")){ %>class="selected"<% } %>>Month statistics</a></li>
			<li><a href="statisticDate.jsp"<% if(request.getRequestURI().contains("statisticDate.jsp")){ %>class="selected"<% } %>>Date statistics</a></li>
		</ul>
	</div>
</body>
</html>
