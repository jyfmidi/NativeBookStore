<%@ page language="java"
	import="java.util.*,entity.Book,entity.User"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%
	ArrayList<Book> cart = (ArrayList<Book>)request.getAttribute("cart");
	if(cart==null) cart=new ArrayList<Book>();
	ArrayList<Integer> bookNums = (ArrayList<Integer>)request.getAttribute("bookNums");
	if(bookNums==null) bookNums=new ArrayList<Integer>();
	String error = request.getParameter("error");
    String success = request.getParameter("success");
    User user=(User)session.getAttribute("user");
	int sum = 0;
	int num=0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/cart.css">
<script type="text/javascript">
	function calc_total(td1) {
		var tbody = td1.parentNode.parentNode;
		var trs = tbody.children;
		var total_num = 0;
		var total_price = 0;
		for ( var i = 1; i <= trs.length - 3; i++) {
			total_price += parseInt(trs[i].lastElementChild.innerHTML);
			total_num += parseInt(trs[i].lastElementChild.previousElementSibling.children[1].innerHTML);
		}
		var td_total_num = document.getElementById("total_num");
		var td_total_price = document.getElementById("total_price");
		td_total_num.innerHTML = total_num + " pics";
		td_total_price.innerHTML = total_price + " RMB";
	}

	function add(a) {
		var num = parseInt(a.nextElementSibling.innerHTML); 
		var td1 = a.parentNode;
		var td_p = td1.previousElementSibling; //one
		var td_n = td1.nextElementSibling; //totall
		var unitprice = td_p.innerHTML;
		var unitprice_num = parseInt(unitprice);
		td_n.innerHTML = unitprice_num * (num + 1) + " RMB";
		a.nextElementSibling.innerHTML = num + 1; //number table cell
		calc_total(td1);
	}

	function sub(a) {
		var num = parseInt(a.previousElementSibling.innerHTML);
		if (parseInt(a.previousElementSibling.innerHTML) - 1 == 0) {
			var p = a.parentNode.parentNode;
			p.remove();
		}
		var td1 = a.parentNode;
		var td_p = td1.previousElementSibling;
		var td_n = td1.nextElementSibling;
		var unitprice = td_p.innerHTML;
		var unitprice_num = parseInt(unitprice);
		td_n.innerHTML = unitprice_num * (num - 1) + "RMB";
		a.previousElementSibling.innerHTML = num - 1;
		calc_total(td1);
	}
</script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div id="content">
		<div id="content-left">
			<div class="gray">
                My cart
			</div>
			
			<div id="cartcart">
			<%
						if (error != null) {
								if (error.equals("noitem")) {
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>No item!</div>");
								}
								else if (error.equals("notlogin")){
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Please login first!</div>");
								}
							}
						if(success != null){
							if(success.equals("checkout"))
							{
							out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:blue;'>Checkout Succeed!</div>");
							}
						}
					%>
				<table class="cart_table">
					<tbody>
						<tr class="cart_title">
							<td>Cover</td>
							<td>Name</td>
							<td>Price</td>
							<td>Quantity</td>
							<td>Total</td>
						</tr>
						<%
							for (int i = 0; i < cart.size(); i++) {
							if(bookNums.get(i) > 0)
							{
						%>
						<tr>
							<td><a
								href="ShowDetailServlet?id=<%=cart.get(i).getBookid()%>"> <img
									src=<%="images/cover/" + cart.get(i).getPhoto()%> alt=""
									title="" border="0" class="cart_thumb">
							</a></td>
							<td><%=cart.get(i).getBookname()%></td>
							<td><%=cart.get(i).getBookprice()%> RMB</td>
							<td><a href="CartServlet?action=add&id=<%=cart.get(i).getBookid()%>">+</a> <span><%=bookNums.get(i) %></span>
								<a href="CartServlet?action=sub&id=<%=cart.get(i).getBookid()%>"">-</a></td>
							<td><%=bookNums.get(i) * cart.get(i).getBookprice()%> RMB</td>
						</tr>
						<%
								num += bookNums.get(i);
								sum += bookNums.get(i) * cart.get(i).getBookprice();
								
							}
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
				<a href="books.jsp" class="continue">&lt; Continue</a>
				 <a href="OrderSevlet"
					class="checkout"<%	
	session.setAttribute("cart", cart);
	session.setAttribute("bookNums",bookNums);
	session.setAttribute("user",user);
					 %>>Check out&gt;</a>
			</div>
		</div>
		<jsp:include page="right.jsp"></jsp:include>
	</div>
</body>

</html>
