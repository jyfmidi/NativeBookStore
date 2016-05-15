<%@page import="entity.Book"%>
<%@page import="entity.BookHandler"%>
<%@page import="entity.OrderHandler"%>
<%@page import="entity.Order"%>
<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/cart.css">
</head>
<body><%
    BookHandler bookHandler=new BookHandler();
   	OrderHandler orderHandler = new OrderHandler();
   	ArrayList<Date>dates=new ArrayList<Date>();
   	ArrayList<Integer>nums=new ArrayList<Integer>();
	%>
	<jsp:include page="statistic_header.jsp"></jsp:include>
	<div id="content">
	
			<div id="cartcart">
			<table class="cart_table">
					<tbody>
						<tr class="cart_title">
						    <td>Date</td>
						    <td>Sales number</td>
						</tr>
						<%
						orderHandler.getStatisticByDate(dates, nums);
							for (int i = 0; i < dates.size(); i++) {
							
						%>
						<tr>
   						    <td><%=dates.get(i)%></td>
   						    <td><%=nums.get(i)%></td>
							
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
	</div>
</body>

</html>
