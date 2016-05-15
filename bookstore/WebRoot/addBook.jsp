<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String error = request.getParameter("error");
	String success=request.getParameter("success");
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
								if (error.equals("booknameexist")) {
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Book Existed!</div>");
								}else if(error.equals("adderror"))
								{
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Add Error!</div>");
								}
							}
			  if(success!=null){
			  if(success.equals("addsuccess")){
			  					out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:green;'>Adding succeed!</div>");
			  }
			  }
					%>
                <form action="AddBookServlet" method="post">
                    <div class="reg_title">Add new book</div>
                    <div class="row1">
                        <label>Book ID:</label>&nbsp;
                        <input name="bookid">
                    </div>
                    <div class="row1">
                        <label>Book name</label>&nbsp;
                        <input name="bookname">
                    </div>
                    <div class="row1">
                        <label>Brief introduction</label>&nbsp;
                        <input name="brief">
                    </div>
                    <div class="row1">
                        <label>Detail introduction</label>&nbsp;
                        <input name="detail">
                    </div>
                    <div class="row1">
                        <label>Price</label>&nbsp;
                        <input name="price">
                    </div>
                    <div class="row1">
                        <label>Photo</label>&nbsp;
                        <input name="photo">
                    </div>
                    <div class="row1">
                        <label>Category</label>&nbsp;
                        <input name="category">
                    </div>
                    
                    <div id="log">
                        <input type="submit" value="Add">
                    </div>
                </form>
                </div>
     </div>
     </div>
</body>

</html>
