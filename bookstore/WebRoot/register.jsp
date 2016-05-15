<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String error = request.getParameter("error");
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
	<jsp:include page="head.jsp"></jsp:include>
	<div id="content">
	<div id="content-left">   
               <div id="register">
               <% 
               if (error != null) {
								if (error.equals("usernameexist")) {
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>User Existed!</div>");
								}else if(error.equals("registererror"))
								{
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Register Error!</div>");
								}
							}
					%>
                <form action="RegisterServlet" method="post">
                    <div class="reg_title">Registration Information</div>
                    <div class="row1">
                        <label>User name</label>&nbsp;
                        <input name="username">
                    </div>
                    <div class="row1">
                        <label>Password</label>&nbsp;
                        <input type="password" name="password">
                    </div>
                    <div class="row1">
                        <label>True name</label>&nbsp;
                        <input name="truename">
                    </div>
                    <div class="row1">
                        <label>Email</label>&nbsp;
                        <input name="email">
                    </div>
                    <div class="row1">
                        <label>Phone number</label>&nbsp;
                        <input name="phonenumber">
                    </div>
                    <div class="row1">
                        <label>Address</label>&nbsp;
                        <input name="address">
                    </div>
                    
                    <div id="log">
                        <input type="submit" value="Register">
                    </div>
                </form>
                </div>
     </div>
     </div>
</body>

</html>
