<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>测试界面</title>
</head>
<body>


	<h1>用户</h1>
	<form action="user/saveUser" method="post">
		username:<input type="text" name="userName" id="userName" />
		password:<input type="password" name="passWord" id="passWord" /> <input
			type="submit" value="注册">
	</form>
	<h1>用户分页查询</h1>
	<a href="user/pageQuery">用户分页查询</a>
	<br>
	<br>
	<a href="user/getUser">id get</a>
	<br>
	<br>
	<a href="user/updateUser">idupdate</a>
	<br>
	<br>
	<a href="user/deleteUser">iddelete</a>
	<br>
	<br>
	<a href="user/queryByName">queryByName</a>
	<br>
	<br>
	<a href="user/testt">queryByCriteria</a>
<h1>图片异步上传</h1>
   <form action="upload/img" method="post" enctype="multipart/form-data">
  文件上传 <input type="file" name="files">
   <input type="submit" value="提交">
   </form>

	<br>

   <form>
   <img alt="" src="xuan/verifyCode"/>
   <input type="submit" value="提交"/>

   </form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<script src="<%=contextPath%>assets/vendor/jquery/jquery.js"></script>
	<script src="<%=contextPath%>admin/login/common.js"> </script>
	<script src="<%=contextPath%>admin/login/testIndex.js"></script>
	
</body>
</html>