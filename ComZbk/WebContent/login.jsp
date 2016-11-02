<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="fixed">
<head>

<!-- Basic -->
<meta charset="UTF-8">

<meta name="keywords" content="HTML5 Admin Template" />
<meta name="description"
	content="Porto Admin - Responsive HTML5 Template">
<meta name="author" content="okler.net">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<!-- Web Fonts  -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="<%=contextPath%>assets/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=contextPath%>assets/vendor/font-awesome/css/font-awesome.css" />
<link rel="stylesheet"
	href="<%=contextPath%>assets/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet"
	href="<%=contextPath%>assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

<!-- Theme CSS -->
<link rel="stylesheet"
	href="<%=contextPath%>assets/stylesheets/theme.css" />

<!-- Skin CSS -->
<link rel="stylesheet"
	href="<%=contextPath%>assets/stylesheets/skins/default.css" />

<!-- Theme Custom CSS -->
<link rel="stylesheet"
	href="<%=contextPath%>assets/stylesheets/theme-custom.css">

<!-- Head Libs -->
<script src="<%=contextPath%>assets/vendor/modernizr/modernizr.js"></script>
<!-- 自定义 -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>css/sigin.css">
<style type="text/css">
.bg {
	font-size: 15px;
	line-height: 1.7;
	font-family: 'Helvetica Neue', Helvetica, 'PingFang SC',
		'Hiragino Sans GB', 'Microsoft YaHei', Arial, sans-serif;
	background: #f7fafc;
	-webkit-font-smoothing: subpixel-antialiased;
}

canvas {
	width: 100px;
	height: 100px;
	position: relative;
	animation: myfirst 5s;
	-webkit-animation: myfirst 5s; /* Safari and Chrome */
}

@
keyframes myfirst { 0% {
	left: 0px;
	top: 0px;
}
25%
{
left
:
200px;
 
top
:
0px;
}
50%
{
left
:
200px;
 
top
:
200px;
}
75%
{
left
:
0px;
 
top
:
200px;
}
100%
{
left
:
0px;
 
top
:
0px;
}
}
</style>
</head>
<body class="bg">
	<!-- start: page -->
	<section class="body-sign">
	<div class="center-sign">
		<a href="/" class="logo pull-left "> <img src="<%=contextPath%>assets/pic/logo.png"
			height="54" alt="Porto Admin" />
		</a>

		<div class="panel panel-sign ">
			<div class="panel-title-sign mt-xl text-right ">
				<h2 class="title text-uppercase text-bold m-none ">
					<i class="fa fa-user mr-xs"></i> 登录
				</h2>
			</div>
			<div class="panel-body ">
				<form method="post" id="form" action="user/login">
					<div class="form-group mb-lg">
						<label>姓名</label>
						<div class="input-group input-group-icon">
							<input name="userName" type="text" class="form-control input-lg" />
							<span class="input-group-addon"> <span
								class="icon icon-lg"> <i class="fa fa-user"></i>
							</span>
							</span>
						</div>
					</div>

					<div class="form-group mb-lg">
						<div class="clearfix">
							<label class="pull-left">密码</label> <a href="##"
								class="pull-right">忘记密码?</a>
						</div>
						<div class="input-group input-group-icon">
							<input name="passWord" type="password"
								class="form-control input-lg" /> <span class="input-group-addon">
								<span class="icon icon-lg"> <i class="fa fa-lock"></i>
							</span>
							</span>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox-custom checkbox-default">
								<input id="RememberMe" name="rememberme" type="checkbox" /> <label
									for="RememberMe">记住我</label>
							</div>
						</div>
						<div class="col-sm-4 text-right">
							<button type="submit"
								class="btn btn-primary hidden-xs submit btn-lg mt-lg btn-block "
								onclick="submit(obj)">登录</button>
							<button type="submit"
								class="btn btn-primary btn-block btn-lg visible-xs mt-lg submit"
								onclick="submit(obj)">登录</button>
						</div>
					</div>

					<span class="mt-lg mb-lg line-thru text-center text-uppercase">
						<span>or</span>
					</span>

					<div class="mb-xs text-center">
						<a class="btn btn-facebook mb-md ml-xs mr-xs">微信登录 <i
							class="fa  fa-comment-o"></i></a> <a
							class="btn btn-twitter mb-md ml-xs mr-xs">新浪登录 <i
							class="fa fa-twitter"></i></a>
					</div>

					<p class="text-center">
						没有密码注册？<a href="pages-signup.html">点击我!</a>
				</form>
			</div>
		</div>

		<p class="text-center text-muted mt-md mb-md">&copy; Copyright
			2016. All Rights Reserved.zbk</p>
	</div>
	</section>
	<!-- <div id="particles"><canvas class="particles-js-canvas-el" width="800" height="902" style="width: 100%;/* height: 100%; */"></canvas></div> -->
	<!-- end: page -->


	<!-- Vendor -->
	<script src="<%=contextPath%>assets/vendor/jquery/jquery.js"></script>
	<script
		src="<%=contextPath%>assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="<%=contextPath%>assets/vendor/bootstrap/js/bootstrap.js"></script>
	<script
		src="<%=contextPath%>assets/vendor/nanoscroller/nanoscroller.js"></script>
	<script
		src="<%=contextPath%>assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script
		src="<%=contextPath%>assets/vendor/magnific-popup/magnific-popup.js"></script>
	<script
		src="<%=contextPath%>assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
	<script
		src="<%=contextPath%>assets/vendor/jquery-validation/jquery.validate.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="<%=contextPath%>assets/javascripts/theme.js"></script>

	<!-- Theme Custom -->
	<script src="<%=contextPath%>assets/javascripts/theme.custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="<%=contextPath%>assets/javascripts/theme.init.js"></script>
	<!--myself  -->
	<script src="<%=contextPath%>admin/login/login.js"></script>
</body>
</html>
