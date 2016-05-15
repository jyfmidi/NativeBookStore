<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.Book"%>
<%@page import="entity.BookHandler"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String error = request.getParameter("error");
%>
<%
Book book=(Book)session.getAttribute("book");
String success = request.getParameter("success");
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
<a href="manageBook_header.jsp">Return</a>
<div id="content">
	<div id="content-left">   
               <div id="register">
              <form action="ManageBookServlet" method="post">
                    <div class="reg_title">Manage book</div>
                    <div class="row1">
                        <label>Book ID:</label>&nbsp;
                        <input name="bookid" value= <%out.println(book.getBookid()); %>>
                    </div>
                    <div class="row1">
                        <label>Book name</label>&nbsp;
                        <input name="bookname" value=<%out.println(book.getBookname()); %>>
                    </div>
                    <div class="row1">
                        <label>Brief introduction</label>&nbsp;
                        <input name="brief" value=<%out.println(book.getBreifintroduction()); %>>
                    </div>
                    <div class="row1">
                        <label>Detail introduction</label>&nbsp;
                        <input name="detail" value=<%out.println(book.getDetailintroduction()); %>>
                    </div>
                    <div class="row1">
                        <label>Price</label>&nbsp;
                        <input name="price" value=<%out.println(book.getBookprice()); %>>
                    </div>
                    <div class="row1">
                        <label>Photo</label>&nbsp;
                        <input name="photo"  value=<%out.println(book.getPhoto()); %>>
                    </div>
                    <div class="row1">
                        <label>Category</label>&nbsp;
                        <input name="category" value=<%out.println(book.getCategroy()); %>>
                    </div>
                    
                    <div id="log">
                        <input type="submit" name="M" value="Modify">
                    </div>
                    <div id="log">
                        <input type="submit" name="D" value="Delete">
                    </div>
                </form>
                </div>
     </div>
     </div>
</body>

</html>
