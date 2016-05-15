<%@page import="entity.UserHandler"%>
<%@page import="entity.CartHandler"%>
<%@page import="entity.BookHandler"%>
<%@page import="entity.Book"%>
<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	CartHandler cartHandler = (CartHandler) session.getAttribute("cartHandler");
	if (cartHandler == null) {
		cartHandler = new CartHandler();
		request.getSession().setAttribute("cartHandler", cartHandler);
	}
	int price_sum = cartHandler.getTotalBookPrice();
	int count = cartHandler.getBookCount();
%>
<div id="content-right">
	<div id="cart">
		<a href="CartServlet" class="red">My cart</a>
	</div>
	<div id="total">
		<%=count%>
		 item <span class="red">| Total: <%=price_sum%> RMB
		</span>
	</div>
	<br />
	<br />
</div>