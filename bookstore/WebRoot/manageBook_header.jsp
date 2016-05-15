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
	<div id="content">
	<div id="content-left">   
	               <div id="register">
	                        <% 
               if (error != null) {
								if (error.equals("bookidfail")) {
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Book not Exist!</div>");
								}else
								{
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Search Error!</div>");
								}
							}
					%>
        
                <form action="FetchBookServlet" method="post">
                    <div class="reg_title">Manage book</div>
                    <div class="row1">
                        <label>Book ID:</label>&nbsp;
                        <input name="bookid">
                    </div>
                    <div id="log">
                        <input type="submit" value="Modify">
                    </div>
                </form>
                </div>
     </div>
     </div>
</body>
</html>
