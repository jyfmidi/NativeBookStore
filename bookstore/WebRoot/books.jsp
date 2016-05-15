<%@page import="entity.Book"%>
<%@page import="entity.BookHandler"%>
<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
	BookHandler bookHandler = new BookHandler();
	String __page = (String) request.getAttribute("page");
	int _page = 1;
	final int _pageSize = 9;
	int _pageRow = bookHandler.getBookCount();
	int _pageCount = _pageRow % _pageSize == 0 ? _pageRow / _pageSize : _pageRow / _pageSize + 1;
	if (__page != null) {
		_page = Integer.parseInt(__page);
	}
	ArrayList<Book> arr = bookHandler.getBookByPage(_page, _pageSize);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/books.css">
</head>
<body><%
    User user = (User) session.getAttribute("user");
	%>
	<jsp:include page="head.jsp"></jsp:include>
	<div id="content">
		<div id="content-left">
			<div id="books">
				<div class="title">
					<a href="index.jsp">Main page</a> -> Books
				</div>
				<div class="gray">
					Books view
				</div>
				<%
					for (int i = 0; i < arr.size(); i++) {
						Book book = arr.get(i);
				%>
				<div class="book">
					<div class="title"><%=book.getBookname()%></div>
					<div class="book-box">
						<a href=<%="ShowDetailServlet?id="+book.getBookid()%>> <img
							src=<%="images/cover/" + book.getPhoto()%>>
						</a>
					</div>
				</div>
				<%
					}
				%>
				<div class="pagination">
					<%
						final int _pageContraints = 6;
						if (_page == 1)
							out.println("<span class='disabled noborder'>&lt;&lt;</span>");
						else
							out.println("<a class='noborder' href='ShowBookServlet?page=" + (_page - 1) + "'><span>&lt;&lt;</span></a>");
						if (_pageCount <= _pageContraints)
							for (int i = 1; i <= _pageCount; i++) {
								if (_page == i)
									out.println("<span class='current'>" + i + "</span>");
								else
									out.println("<a href='ShowBookServlet?page=" + i + "'>" + i + "</a>");
							}
						else {
							if(_page >= 3 && _pageCount - _page > 4)
							{
								for (int i = _page - 1 ; i <= _page + 1; i++) {
									if (_page == i)
										out.println("<span class='current'>" + i + "</span>");
									else
										out.println("<a href='ShowBookServlet?page=" + i + "'>" + i + "</a>");
								}
							}else
							{
								for (int i = 1 ; i <= 3; i++) {
									if (_page == i)
										out.println("<span class='current'>" + i + "</span>");
									else
										out.println("<a href='ShowBookServlet?page=" + i + "'>" + i + "</a>");
								}
							}
							if(_pageCount - _page <= 4 && _page >= 3)
							{
								out.println("...");
							}
							if(_pageCount - _page <= 4)
							{
								for (int i = _pageCount - 4; i <= _pageCount; i++) {
									if (_page == i)
										out.println("<span class='current'>" + i + "</span>");
									else
										out.println("<a href='ShowBookServlet?page=" + i + "'>" + i + "</a>");
								}
							}
							else
							{
								out.println("...");
								for (int i = _pageCount - 2; i <= _pageCount; i++) {
									if (_page == i)
										out.println("<span class='current'>" + i + "</span>");
									else
										out.println("<a href='ShowBookServlet?page=" + i + "'>" + i + "</a>");
								}
							}
						}
						if (_page == _pageCount)
							out.println("<span class='disabled noborder'>&gt;&gt;</span>");
						else
							out.println("<a  class='noborder' href='ShowBookServlet?page=" + (_page + 1) + "'><span>&gt;&gt;</span></a>");
					%>

					<!-- <span class='current'>1</span> <a href="ShowBookServlet?page=3">3</a>…
					<a href="#?page=199">10</a> <a href="#?page=200">11</a> <a
						href="#?page=2"></a> -->
				</div>
			</div>
		</div>
		<jsp:include page="right.jsp"></jsp:include>
	</div>
</body>

</html>
