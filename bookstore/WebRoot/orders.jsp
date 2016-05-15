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
    User user = (User)session.getAttribute("user");
    BookHandler bookHandler=new BookHandler();
   	OrderHandler orderHandler = new OrderHandler();
   	String username=user.getUsername();
	ArrayList<Order> arr = orderHandler.getAllOrdersByUser(username);
	%>
	<jsp:include page="head.jsp"></jsp:include>
	<div id="content">
			<div class="gray">
                My orders
			</div>
			
			<div id="cartcart">
			<table class="cart_table">
					<tbody>
						<tr class="cart_title">
						    <td>Order Number</td>
							<td>Cover</td>
							<td>Name</td>
							<td>Price</td>
							<td>Quantity</td>
							<td>Date</td>
							<td>Status</td>
						</tr>
						<%
						    int sum=0;
						    int num=0;
							for (int i = 0; i < arr.size(); i++) {
							Order temp=arr.get(i);
							Book tbook=bookHandler.getBook(temp.getBookid());
						%>
						<tr>
   						    <td><%=temp.getOrderid()%></td>
							<td><a
								href="ShowDetailServlet?id=<%=temp.getBookid()%>"> <img
									src=<%="images/cover/" + tbook.getPhoto()%> alt=""
									title="" border="0" class="cart_thumb">
							</a></td>
							<td><a
								href="ShowDetailServlet?id=<%=temp.getBookid()%>">
								<%=tbook.getBookname()%></a></td>
							<td><%=tbook.getBookprice()%> RMB</td>
							<td><%=temp.getQuantity()%></td>
							<td><%=temp.getPaiddate()%></td>
							<td><%=temp.getStatus()%></td>
						</tr>
						<%
								num += temp.getQuantity();
								sum += temp.getQuantity() * tbook.getBookprice();
						}
						%>
						<tr>
							<td colspan="4" class="cart_total"><span class="red">Total quantity:</span>
							</td>
							<td id="total_num"><%=num%> pics</td>
						</tr>
						<tr>
							<td colspan="4" class="cart_total"><span class="red">Total price:</span>
							</td>
							<td id="total_price"><%=sum%> RMB</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>
</body>

</html>
