<%@page import="entity.Book"%>
<%@page import="entity.OrderHandler"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	Book book = (Book) request.getAttribute("book");
	OrderHandler orderHandler=new OrderHandler();
	long bid=book.getBookid();
	int sales=orderHandler.getOrdersCountByBook(bid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/details.css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div id="content">
		<div id="content-left">
			<div id="detailsdetails">
				<div class="title">
					<a href="index.jsp">Main page</a> -> Books
				</div>
				<div class="gray">
					<%=book.getBookname()%>
				</div>
				<div class="item">
					<div class="item-left">
						<img
							src=<%="images/cover/" + book.getPhoto()%>>
					</div>
					<div class="item-right">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="orange">Introduction:</div>
							<p class="details">
								<%=book.getBreifintroduction()%>
							</p>
						</div>
						<div class="box_bottom"></div>
					</div>
				</div>
				<fieldset>
					<div class="ttt">
						<span>Name: <%=book.getBookname() %></span>
						<br> <span>Price: <%=book.getBookprice() %> RMB</span>
						<br> <span>Sales count: <%=sales %> pics</span>						
					</div>
					<hr>
					<p><%=book.getDetailintroduction() %>
					</p>
				</fieldset>
				<a href="CartServlet?id=<%=book.getBookid()%>" class="addtocart">
                    <img src="images/addtocart.png">
                </a>
			</div>
		</div>
		<jsp:include page="right.jsp"></jsp:include>
	</div>
</body>

</html>
