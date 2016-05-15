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
   	ArrayList<Integer>years=new ArrayList<Integer>();
   	ArrayList<Integer>months=new ArrayList<Integer>();
   	ArrayList<Integer>nums=new ArrayList<Integer>();
	%>
	<jsp:include page="statistic_header.jsp"></jsp:include>
	<div id="content">
	
			<div id="cartcart">
			<table class="cart_table">
			<%
						orderHandler.getStatisticByYearMonth(years,months,nums);
						int tempyear=years.get(0);
						%>
						<div id="menu"><ul>
						<%=tempyear%>
						</ul>
						</div>
				     	<tbody>
										
						<tr class="cart_title">
						    <td>Month</td>
						    <td>Sales number</td>
						</tr>
						<% 
					    for (int i = 0; i < months.size(); i++) {
							if(tempyear!=years.get(i)){
						%>
						<div id="menu"><ul>
						<%=years.get(i)%>
						</ul>
						</div>
				     	<tbody>
										
						<tr class="cart_title">
						    <td>Month</td>
						    <td>Sales number</td>
						</tr>
						<%} else{%>
						<tr>
   						    <td><%=months.get(i)%></td>
   						    <td><%=nums.get(i)%></td>
							
						</tr>
						    <%}%>
						</tbody>
						<%} %>
					
				</table>
			</div>
	</div>
</body>

</html>
