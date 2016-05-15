<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String error = request.getParameter("error");
	session.setAttribute("target", null);
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
								if (error.equals("useridfail")) {
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>User not Exist!</div>");
								}else
								{
									out.println("<div style='font-size:15px;margin:3px 0 3px 1px;color:red;'>Search Error!</div>");
								}
							}
					%>
        
                <form action="FetchUserServlet" method="post">
                    <div class="reg_title">Manage user</div>
                    <div class="row1">
                        <label>User ID:</label>&nbsp;
                        <input name="userid">
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
