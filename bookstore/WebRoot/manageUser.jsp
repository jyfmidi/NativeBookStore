<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.User"%>
<%@page import="entity.UserHandler"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
  String error = request.getParameter("error");
%>
<%
User target=(User)session.getAttribute("target");
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
<a href="manageUser_header.jsp">Return</a>
<div id="content">
  <div id="content-left">   
               <div id="register">
              <form action="ManageUserServlet" method="post">
                    <div class="reg_title">Manage user</div>
                    <div class="row1">
                        <label>User ID:</label>&nbsp;
                        <input name="userid" value= <%out.println(target.getUserid()); %>>
                    </div>
                    <div class="row1">
                        <label>User name:</label>&nbsp;
                        <input name="username" value= <%out.println(target.getUsername()); %>>
                    </div>
                    <div class="row1">
                        <label>True name:</label>&nbsp;
                        <input name="truename" value=<%out.println(target.getTruename()); %>>
                    </div>
                    <div class="row1">
                        <label>Password:</label>&nbsp;
                        <input name="password" value=<%out.println(target.getPassword_()); %>>
                    </div>
                    <div class="row1">
                        <label>Email:</label>&nbsp;
                        <input name="email" value=<%out.println(target.getEmail()); %>>
                    </div>
                    <div class="row1">
                        <label>Phone number:</label>&nbsp;
                        <input name="phonenumber" value=<%out.println(target.getPhone()); %>>
                    </div>
                    <div class="row1">
                        <label>Address:</label>&nbsp;
                        <input name="address"  value=<%out.println(target.getAddress_()); %>>
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
