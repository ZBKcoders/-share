<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String contextPath = request.getContextPath() + "/";
%>

<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>ZBK后端管理</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="<%=contextPath %>assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=contextPath %>assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="<%=contextPath %>assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="<%=contextPath %>assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="<%=contextPath %>assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="<%=contextPath %>assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
       <link rel="stylesheet" href="<%=contextPath %>assets/vendor/pnotify/pnotify.custom.css" />
       
		<!-- Theme CSS -->
		<link rel="stylesheet" href="<%=contextPath %>assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="<%=contextPath %>assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="<%=contextPath %>assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="<%=contextPath %>assets/vendor/modernizr/modernizr.js"></script>
     <style type="text/css">
     .input-img-add {
    line-height: 80px;
    font-family: 微软雅黑, "Microsoft YaHei", Arial, Georgia, Verdana, serif;
    color: rgb(170, 170, 170);
    cursor: pointer;
    background-size: cover;
    font-size: 80px;
    border-width: 3px;
    border-style: dashed;
    border-color: rgb(170, 170, 170);
    border-image: initial;
    background-position: center center;
    background-repeat: no-repeat;
}
.input-img, .input-img-add {
    width: 100px;
    height: 100px;
    margin: 5px;
    padding: 10px;
    display: inline;
    position: relative;
    float: left;
    text-align: center;
    vertical-align: middle;
}
     </style>
	</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<header class="header">
				<div class="logo-container">
					<a href="/" class="logo">
						<img src="<%=contextPath %>assets/pic/logo.png" height="35" alt="Porto Admin" />
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div>
			
				<!-- start: search & user box -->
				<div class="header-right">
			
					<div class="search nav-form">
						<div class="input-group input-search">
							<input type="text" class="form-control" name="q" id="q" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
							</span>
						</div>
					</div>
			
					<span class="separator"></span>
			
					<ul class="notifications">
						<li>
							<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
								<i class="fa fa-tasks"></i>
								<span class="badge">3</span>
							</a>
			
							<div class="dropdown-menu notification-menu large">
								<div class="notification-title">
									<span class="pull-right label label-default">3</span>
									Tasks
								</div>
			
								<div class="content">
									<ul>
										<li>
											<p class="clearfix mb-xs">
												<span class="message pull-left">Generating Sales Report</span>
												<span class="message pull-right text-dark">60%</span>
											</p>
											<div class="progress progress-xs light">
												<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
											</div>
										</li>
			
										<li>
											<p class="clearfix mb-xs">
												<span class="message pull-left">Importing Contacts</span>
												<span class="message pull-right text-dark">98%</span>
											</p>
											<div class="progress progress-xs light">
												<div class="progress-bar" role="progressbar" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100" style="width: 98%;"></div>
											</div>
										</li>
			
										<li>
											<p class="clearfix mb-xs">
												<span class="message pull-left">Uploading something big</span>
												<span class="message pull-right text-dark">33%</span>
											</p>
											<div class="progress progress-xs light mb-xs">
												<div class="progress-bar" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%;"></div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</li>
						<li>
							<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
								<i class="fa fa-envelope"></i>
								<span class="badge">4</span>
							</a>
			
							<div class="dropdown-menu notification-menu">
								<div class="notification-title">
									<span class="pull-right label label-default">230</span>
									Messages
								</div>
			
								<div class="content">
									<ul>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Doe</span>
												<span class="message">Lorem ipsum dolor sit.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Junior</span>
												<span class="message truncate">Truncated message.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle" />
												</figure>
												<span class="title">Joe Junior</span>
												<span class="message">Lorem ipsum dolor sit.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Junior</span>
												<span class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </span>
											</a>
										</li>
									</ul>
			
									<hr />
			
									<div class="text-right">
										<a href="#" class="view-more">View All</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
								<i class="fa fa-bell"></i>
								<span class="badge">3</span>
							</a>
			
							<div class="dropdown-menu notification-menu">
								<div class="notification-title">
									<span class="pull-right label label-default">3</span>
									Alerts
								</div>
			
								<div class="content">
									<ul>
										<li>
											<a href="#" class="clearfix">
												<div class="image">
													<i class="fa fa-thumbs-down bg-danger"></i>
												</div>
												<span class="title">Server is Down!</span>
												<span class="message">Just now</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<div class="image">
													<i class="fa fa-lock bg-warning"></i>
												</div>
												<span class="title">User Locked</span>
												<span class="message">15 minutes ago</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<div class="image">
													<i class="fa fa-signal bg-success"></i>
												</div>
												<span class="title">Connection Restaured</span>
												<span class="message">10/10/2014</span>
											</a>
										</li>
									</ul>
			
									<hr />
			
									<div class="text-right">
										<a href="#" class="view-more">View All</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
			
					<span class="separator"></span>
			
					<div id="userbox" class="userbox">
						<a href="#" data-toggle="dropdown">
							<figure class="profile-picture">
								<img src="<%=contextPath %>assets/pic/head.jpeg" alt="Joseph Doe" class="img-circle" data-lock-picture="assets/images/!logged-user.jpg" />
							</figure>
							<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
								<span class="name">John Doe Junior</span>
								<span class="role">administrator</span>
							</div>
			
							<i class="fa custom-caret"></i>
						</a>
			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
									<a role="menuitem" tabindex="-1" href="pages-user-profile.html"><i class="fa fa-user"></i> My Profile</a>
								</li>
								<li>
									<a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> Lock Screen</a>
								</li>
								<li>
									<a role="menuitem" tabindex="-1" href="pages-signin.html"><i class="fa fa-power-off"></i> Logout</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- end: search & user box -->
			</header>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<aside id="sidebar-left" class="sidebar-left">
				
					<div class="sidebar-header">
						<div class="sidebar-title">
							操作栏
						</div>
						<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
							<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
						</div>
					</div>
				
					<div class="nano">
						<div class="nano-content">
							<nav id="menu" class="nav-main" role="navigation">
								<ul class="nav nav-main">
									<li>
										<a href="index.html">
											<i class="fa fa-home" aria-hidden="true"></i>
											<span>主页</span>
										</a>
									</li>
									<li>
										<a href="mailbox-folder.html">
											<span class="pull-right label label-primary">182</span>
											<i class="fa fa-envelope" aria-hidden="true"></i>
											<span>邮箱</span>
										</a>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-copy" aria-hidden="true"></i>
											<span>Pages</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="pages-signup.html">
													 Sign Up
												</a>
											</li>
											
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-tasks" aria-hidden="true"></i>
											<span>待定</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="ui-elements-typography.html">
													 待定子类
												</a>
											</li>
											
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-list-alt" aria-hidden="true"></i>
											<span>待定</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="forms-basic.html">
													 待定子类
												</a>
											</li>
											
										</ul>
									</li>
									<li class="nav-parent nav-expanded nav-active">
										<a>
											<i class="fa fa-table" aria-hidden="true"></i>
											<span>管理</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="tables-basic.html">
													 人员管理
												</a>
											</li>
											
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-map-marker" aria-hidden="true"></i>
											<span>待定</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="maps-google-maps.html">
													 待定子类
												</a>
											</li>
											
										</ul>
									</li>
									<li class="nav-parent">
										<a>
											<i class="fa fa-columns" aria-hidden="true"></i>
											<span>待定</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="layouts-default.html">
													待定子类
												</a>
											</li>
											
										</ul>
									</li>
									<li>
										<a href="http://themeforest.net/item/porto-responsive-html5-template/4106987?ref=Okler" target="_blank">
											<i class="fa fa-external-link" aria-hidden="true"></i>
											<span>Front-End <em class="not-included">(Not Included)</em></span>
										</a>
									</li>
								</ul>
							</nav>
				
							<hr class="separator" />
				
							<div class="sidebar-widget widget-tasks">
								<div class="widget-header">
									<h6>Projects</h6>
									<div class="widget-toggle">+</div>
								</div>
								<div class="widget-content">
									<ul class="list-unstyled m-none">
										<li><a href="#">Porto HTML5 Template</a></li>
										<li><a href="#">Tucson Template</a></li>
										<li><a href="#">Porto Admin</a></li>
									</ul>
								</div>
							</div>
				
							<hr class="separator" />
				
							<div class="sidebar-widget widget-stats">
								<div class="widget-header">
									<h6>Company Stats</h6>
									<div class="widget-toggle">+</div>
								</div>
								<div class="widget-content">
									<ul>
										<li>
											<span class="stats-title">Stat 1</span>
											<span class="stats-complete">85%</span>
											<div class="progress">
												<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
													<span class="sr-only">85% Complete</span>
												</div>
											</div>
										</li>
										<li>
											<span class="stats-title">Stat 2</span>
											<span class="stats-complete">70%</span>
											<div class="progress">
												<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</li>
										<li>
											<span class="stats-title">Stat 3</span>
											<span class="stats-complete">50%</span>
											<div class="progress">
												<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
													<span class="sr-only">50% Complete</span>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
				
					</div>
				
				</aside>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<header class="page-header">
						<h2>人员列表</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><a href="/">管理</a></li>
								<li><span>人员列表</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<section class="panel panel-primary">
						<header class="panel-heading">
							<div class="panel-actions">
								<a href="#" class="fa fa-caret-down"></a>
								<a href="#" class="fa fa-times"></a>
							</div>

							<h2 class="panel-title">人员管理</h2>
						</header>
					<div class="panel-body">
						<form id="SearchForm" class="form-horizontal form-search"
							role="form">
							<input type="hidden" class="nowId">
							<div class="form-group">
								<label for="Search_wxWallId" class="col-sm-1 control-label">编号</label>
								<div class="col-sm-2">
									<input type="text" class="input-sm form-control"
										id="Search_wxWallId" name="ticketId" placeholder="活动编号" />
								</div>
								<label for="Search_Title" class="col-sm-2 control-label">活动标题</label>
								<div class="col-sm-2">
									<input type="text" class="input-sm form-control"
										id="Search_Title" name="title" placeholder="活动标题" />
								</div>
								<label class="col-sm-1 control-label">添加时间</label>
								<div class="col-sm-4 DatePicker">
									<div class="input-daterange input-group" id="datepicker"
										data-plugin-datepicker
										data-plugin-options='{"format":"yyyy-mm-dd","language":"zh-CN"}'>
										<input type="text" class="input-sm form-control"
											id="Search_StartTime" name="startTime" /> <span
											class="input-group-addon">-</span> <input type="text"
											class="input-sm form-control" id="Search_EndTime"
											name="endTime" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="Search_NickName" class="col-sm-1 control-label">发布者</label>
								<div class="col-sm-2">
									<input type="text" class="input-sm form-control"
										id="Search_NickName" name="adminId" placeholder="发布者" />
								</div>

								<label for="Search_review" class="col-sm-2 control-label">状态</label>
								<div class="col-sm-2">
									<select class="input-sm form-control span3" id="review"
										name="review" style="padding-top: 0px;">
										<option value="0">全部</option>
										<option value="1">待审核</option>
										<option value="2">已审核</option>
										<option value="5">未通过</option>
									</select>
								</div>
								<div class="col-sm-5">
									<button type="button" class="btn btn-default btn_search"
										onclick="showSelectList(1);"
										style="margin-bottom:15px;">搜索</button>
								</div>
							</div>
						</form>
						
						<div class="table-responsive list-result">
						<div class="span6 p-xs" style="min-height: 30px;">
								<div id="DataTables_Table_0_length" class="dataTables_length">
									<label class="control-label"
										style="display: inline-block; float: left"> 
										<select class=" mr-xs" id="pageSize" size="1"
										name="DataTables_Table_0_length"
										aria-controls="DataTables_Table_0"
										onchange="showSelectList(1)">
											<option value="10" selected="selected">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option>
									</select>每页显示条数
									</label>
								</div>


								<span id="refresh"></span> </label>
							</div>
							<table
								class="table table-bordered table-striped table-condensed mb-none text-center fix-table-thumb-text"
								id="dataList">
								<thead>
									<tr>
										<th class="text-center">编号</th>
										<th class="text-center">头像</th>
										<th class="text-center">姓名</th>
										<th class="text-center">密码</th>
										<th class="text-center">年龄</th>
										<th class="text-center">邮箱</th>
										<th class="text-center">手机</th>
										<th class="text-center">添加时间</th>
										<th class="text-center">描述</th>
										<th class="text-center">操作</th>
									
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
						<div class="list-empty text-center" style="display: none;">暂无数据！</div>
						<div class="text-center">
							<ul class="pagination pagination-sm pagination-right"
								id="pagination_managelist">
							</ul>
						</div>
					</div>
				</section>

				<!-- Modal edit-->
				<div class="modal fade" id="myEditModal" tabindex="-1" role="dialog"
					aria-labelledby="myEditModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myEditModalLabel">编辑用户信息</h4>
							</div>
							<div class="widget-body p-md">
								<form id="mainManageForm" class="form-horizontal" role="form">
									<input type="hidden" id="userId" name="userId" />
									<div class="form-group">
										<label for=userName class="col-sm-3 control-label">用户名</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="userName"
												name="userName" placeholder="用户名" required/>
										</div>
									</div>
									<div class="form-group">
										<label for=passWord class="col-sm-3 control-label">密码</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="passWord"
												name="passWord" placeholder="密码"/>
										</div>
									</div>
										<div class="form-group">
										<label for=phoneNum class="col-sm-3 control-label">手机号码</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="phoneNum"
												name="phoneNum" placeholder="手机号码"/>
										</div>
									</div>
									<div class="form-group">
										<label for=email class="col-sm-3 control-label">邮箱</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="email"
												name="email" placeholder="邮箱"/>
										</div>
									</div>
									<div class="form-group">
										<label for="imgInputFile" class="col-sm-3 control-label">头像</label>
										<div class="col-sm-6">
											<label class="input-img-add imagePath" id="imgAddBtn" for="imgInputFile">
                                                      <span>+</span>
                                            </label> 
                                            <input class="headImg" id="headImg" name="headImg"
										type="hidden" value="" style="display: none;" />
									<div style="visibility: hidden;">
												<input id="imgInputFile" class="imagepath" name="files"
													type="file" value="" style="visibility: hidden;" />
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="userDec" class="col-sm-3 control-label">活动描述</label>
										<div class="col-sm-6">
											<textarea id="userDec" name="userDec"
												class="form-control" rows="4" style="width: 100%;"
												check-type="required" required-message="活动描述不能为空！"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-4"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-default submit"
												onclick="editManage(this);">修改</button>
										</div>
										<div class="col-sm-4"></div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<span class="error-text" style="color: #FF0000;"></span>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- model  alert -->
									<div class="modal fade" id="modalBootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="text-align:center">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
													<h4 class="modal-title" id="myModalLabel">删除</h4>
												</div>
												<div class="modal-body">
												<input type="hidden" id="deleteUserId" name="userId" />
													 <p>确定删除该信息?</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" onclick="deleteMannage(this);">删除</button>
													<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												</div>
											</div>
										</div>
									</div>
				<!-- end: page -->
				</section>
			
              <!-- 右侧隐藏部分 -->
			<aside id="sidebar-right" class="sidebar-right">
				<div class="nano">
					<div class="nano-content">
						<a href="#" class="mobile-close visible-xs">
							Collapse <i class="fa fa-chevron-right"></i>
						</a>
			
						<div class="sidebar-right-wrapper">
			
							<div class="sidebar-widget widget-calendar">
								<h6>Upcoming Tasks</h6>
								<div data-plugin-datepicker data-plugin-skin="dark" ></div>
			
								<ul>
									<li>
										<time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
										<span>Company Meeting</span>
									</li>
								</ul>
							</div>
			
							<div class="sidebar-widget widget-friends">
								<h6>Friends</h6>
								<ul>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="<%=contextPath %>assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
								</ul>
							</div>
			
						</div>
					</div>
				</div>
			</aside>
		</section>

		<!-- Vendor -->
		<script src="<%=contextPath %>assets/vendor/jquery/jquery.js"></script>
		<script src="<%=contextPath %>assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="<%=contextPath %>assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="<%=contextPath %>assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="<%=contextPath %>assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="<%=contextPath %>assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="<%=contextPath %>assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
	
		<!-- Specific Page Vendor 功能专项 -->
		<script src="<%=contextPath %>assets/vendor/select2/select2.js"></script>
		<script src="<%=contextPath %>assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="<%=contextPath %>assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
		<script src="<%=contextPath %>assets/vendor/pnotify/pnotify.custom.js"></script>
		<script src="<%=contextPath%>assets/vendor/jquery-validation/jquery.validate.js"></script>
		  <script src="<%=contextPath %>assets/vendor/jquery-fileupload/jquery.ui.widget.js"></script>
        <script src="<%=contextPath %>assets/vendor/jquery-fileupload/jquery.iframe-transport.js"></script>
		 <script src="<%=contextPath %>assets/vendor/jquery-fileupload/jquery.fileupload.js"></script>
		 
		<!-- Theme Base, Components and Settings -->
		<script src="<%=contextPath %>assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="<%=contextPath %>assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="<%=contextPath %>assets/javascripts/theme.init.js"></script>
		<!-- pageSuccessNote-->
   
		<!-- Examples -->
		<script type="text/javascript" src="<%=contextPath %>admin/main/commonzbk.js"></script>
		<script type="text/javascript" src="<%=contextPath %>admin/main/main.js"></script>
	</body>
</html>