<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    String contextPath = request.getContextPath() + "/";
    %>
    <!doctype html>
<html class="fixed">
    
    <head>
        <!-- Basic -->
        <meta charset="UTF-8">
        <title>
           个人主页

        </title>
        <meta name="keywords" content="HTML5 Admin Template" />
        <meta name="description" content="Porto Admin - Responsive HTML5 Template">
        <meta name="author" content="okler.net">
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
        />
        <!-- Web Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
        rel="stylesheet" type="text/css">
        <!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
        <!-- Vendor CSS -->
        <link rel="stylesheet" href="<%=contextPath %>assets/vendor/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" href="<%=contextPath %>assets/vendor/font-awesome/css/font-awesome.css"/>
        <link rel="stylesheet" href="<%=contextPath %>assets/vendor/magnific-popup/magnific-popup.css"/>
        <link rel="stylesheet" href="<%=contextPath %>assets/vendor/bootstrap-datepicker/css/datepicker3.css"/>
        <!-- Theme CSS -->
        <link rel="stylesheet" href="<%=contextPath %>assets/stylesheets/theme.css" />
        <!-- Skin CSS -->
        <link rel="stylesheet" href="<%=contextPath %>assets/stylesheets/skins/default.css" />
        <!-- Theme Custom CSS -->
        <link rel="stylesheet" href="<%=contextPath %>assets/stylesheets/theme-custom.css">
        <!-- Head Libs -->
        <script src="<%=contextPath %>assets/vendor/modernizr/modernizr.js">
        </script>
    </head>
    
    <body>
        <section class="body">
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
													<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Doe</span>
												<span class="message">Lorem ipsum dolor sit.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Junior</span>
												<span class="message truncate">Truncated message.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle" />
												</figure>
												<span class="title">Joe Junior</span>
												<span class="message">Lorem ipsum dolor sit.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle" />
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
            <!-- start: page -->
            <div class="row">
                <div class="col-md-4 col-lg-3">
                    <section class="panel">
                        <div class="panel-body">
                            <div class="thumb-info mb-md">
                                <img src="<%=contextPath %>assets/pic/head.jpeg" class="rounded img-responsive"
                                alt="John Doe" id="headImg">
                                <div class="thumb-info-title">
                                    <span class="thumb-info-inner">
                                        周博开
                                    </span>
                                    <span class="thumb-info-type">
                                        CTO
                                    </span>
                                </div>
                            </div>
                            <div class="widget-toggle-expand mb-md">
                                <div class="widget-header">
                                    <h6>
                                       信息完整度
                                    </h6>
                                    <div class="widget-toggle">
                                        +
                                    </div>
                                </div>
                                <div class="widget-content-collapsed">
                                    <div class="progress progress-xs light">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                        aria-valuemax="100" style="width: 60%;">
                                            60%
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content-expanded">
                                    <ul class="simple-todo-list">
                                        <li class="completed">
                                            图片上传
                                        </li>
                                        <li class="completed">
                                            个人信息
                                        </li>
                                        <li class="completed">
                                            工作年限
                                        </li>
                                        <li class="completed">
                                            java等级
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <hr class="dotted short">
                            <h6 class="text-muted">
                                关于
                            </h6>
                            <p>
                                java的忠实粉丝。。。
                                什么PHP、ASP都不会，只会JSP
                                Ajax、jQuery、JSoup、http协议
                                struts、hibernate、spring、springmvc
                                svn。都会
                            </p>
                            <div class="clearfix">
                                <a class="text-uppercase text-muted pull-right" href="#">
                                    (更多。。)
                                </a>
                            </div>
                            <hr class="dotted short">
                            <div class="social-icons">
                                <a rel="tooltip" data-placement="bottom" target="_blank" href="http://www.facebook.com"
                                data-original-title="Facebook">
                                    <i class="fa fa-facebook">
                                    </i>
                                    <span>
                                        Facebook
                                    </span>
                                </a>
                                <a rel="tooltip" data-placement="bottom" href="http://www.twitter.com"
                                data-original-title="Twitter">
                                    <i class="fa fa-twitter">
                                    </i>
                                    <span>
                                        Twitter
                                    </span>
                                </a>
                                <a rel="tooltip" data-placement="bottom" href="http://www.linkedin.com"
                                data-original-title="Linkedin">
                                    <i class="fa fa-linkedin">
                                    </i>
                                    <span>
                                        Linkedin
                                    </span>
                                </a>
                            </div>
                        </div>
                    </section>
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down">
                                </a>
                                <a href="#" class="fa fa-times">
                                </a>
                            </div>
                            <h2 class="panel-title">
                                <span class="label label-primary label-sm text-normal va-middle mr-sm">
                                    1000
                                </span>
                                <span class="va-middle">
                                   商业伙伴
                                </span>
                            </h2>
                        </header>
                        <div class="panel-body">
                            <div class="content">
                                <ul class="simple-user-list">
                                    <li>
                                        <figure class="image rounded">
                                            <img src="pic/13.jpg" alt="Joseph Doe Junior" class="img-circle" width="35px" height="35px">
                                        </figure>
                                        <span class="title">
                                            习近平
                                        </span>
                                        <span class="message truncate">
                                            中华人民共和国主席
                                        </span>
                                    </li>
                                    <li>
                                        <figure class="image rounded">
                                            <img src="pic/page1.jpg" alt="Joseph Junior" class="img-circle" width="35px" height="35px">
                                        </figure>
                                        <span class="title">
                                            权志龙
                                        </span>
                                        <span class="message truncate">
                                            超人气韩国明星
                                        </span>
                                    </li>
                                    <li>
                                        <figure class="image rounded">
                                            <img src="pic/page2.jpg" alt="Joe Junior" class="img-circle" width="35px" height="35px">
                                        </figure>
                                        <span class="title">
                                            Top
                                        </span>
                                        <span class="message truncate">
                                            wuli欧巴
                                        </span>
                                    </li>
                                    <li>
                                        <figure class="image rounded">
                                            <img src="pic/12.jpg" alt="Joseph Doe Junior" class="img-circle" width="35px" height="35px">
                                        </figure>
                                        <span class="title">
                                            朴信惠
                                        </span>
                                        <span class="message truncate">
                                            wuli欧尼
                                        </span>
                                    </li>
                                </ul>
                                <hr class="dotted short">
                                <div class="text-right">
                                    <a class="text-uppercase text-muted" href="#">
                                        (View All)
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="input-group input-search">
                                <input type="text" class="form-control" name="q" id="q" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="fa fa-search">
                                        </i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </section>
                   
                </div>

                <div class="col-md-8 col-lg-6">
                <!-- 积分 -->
                 <section class="panel">
                                        <div class="panel-body bg-primary">
                                            <div class="widget-summary">
                                                <div class="widget-summary-col widget-summary-col-icon">
                                                    <div class="summary-icon">
                                                        <i class="fa fa-life-ring"></i>
                                                    </div>
                                                </div>
                                                <div class="widget-summary-col">
                                                    <div class="summary">
                                                        <h4 class="title">Support Questions</h4>
                                                        <div class="info">
                                                            <strong class="amount">1281</strong>
                                                        </div>
                                                    </div>
                                                    <div class="summary-footer">
                                                        <a class="text-uppercase">(view all)</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                <!-- 积分 -->
                    <div class="tabs">
                        <ul class="nav nav-tabs tabs-primary">
                            <li class="active">
                                <a href="#overview" data-toggle="tab">
                                    时光
                                </a>
                            </li>
                            <li>
                                <a href="#edit" data-toggle="tab">
                                    更新信息
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="overview" class="tab-pane active">
                                <h4 class="mb-md">
                                   更新日志
                                </h4>
                                <section class="simple-compose-box mb-xlg">
                                    <form method="get" action="/">
                                        <textarea name="message-text" data-plugin-textarea-autosize placeholder="What's on your mind?"
                                        rows="1">
                                        </textarea>
                                    </form>
                                    <div class="compose-box-footer">
                                        <ul class="compose-toolbar">
                                            <li><!--图片上传  -->
                                                <a href="#">
                                                    <i class="fa fa-camera">
                                                    </i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-map-marker">
                                                    </i>
                                                </a>
                                            </li>
                                        </ul>
                                        <ul class="compose-btn">
                                            <li>
                                                <a class="btn btn-primary btn-xs">
                                                    发表
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </section>
                                <h4 class="mb-xlg">
                                    时间轨迹
                                </h4>
                                <div class="timeline timeline-simple mt-xlg mb-md">
                                    <div class="tm-body">
                                        <div class="tm-title">
                                            <h3 class="h5 text-uppercase">
                                                2016-6-20
                                            </h3>
                                        </div>
                                        <ol class="tm-items">
                                            <li>
                                                <div class="tm-box">
                                                    <p class="text-muted mb-none">
                                                        6-20
                                                    </p>
                                                    <p>
                                                        正式成为一名后端程序员
                                                        <span class="text-primary">
                                                            #值的记住
                                                        </span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="tm-box">
                                                    <p class="text-muted mb-none">
                                                        2013-9-16
                                                    </p>
                                                    <p>
                                                        铃声单调，那年初中玩闹，我们欢笑，我们打闹，你说叫我忘掉，你说这不是开玩笑。 铃声回荡，那年高中难忘，我们凝望，我们惆怅，你说不求奢望，你说这让彼此迷茫。 夕阳西下，我却放不下，在等下，负出那些下，好让自己放下。 少年无暇，你却不理下，在等下，理解那一下，好让自己放下。 很久很久以后，你清秀的脸依旧，而我不在你左右，你也明白了那年不是作秀。 （送给所有的朋友'''）
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="tm-box">
                                                    <p class="text-muted mb-none">
                                                        2013-9-1
                                                    </p>
                                                    <p>
                                                        第一次出远门
                                                        去学校
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="tm-box">
                                                    <p class="text-muted mb-none">
                                                        2013-6-10
                                                    </p>
                                                    <p>
                                                        终于解放了
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="tm-box">
                                                    <p class="text-muted mb-none">
                                                       2012-12-30
                                                    </p>
                                                    <p>
                                                        很傻！
                                                    </p>
                                                    <div class="thumbnail-gallery">
                                                        <a class="img-thumbnail lightbox" href="assets/images/projects/project-4.jpg"
                                                        data-plugin-options='{"type":"image"}'>
                                                            <img class="img-responsive" width="150px"  src="pic/psb.jpg">
                                                            <span class="zoom">
                                                                <i class="fa fa-search">
                                                                </i>
                                                            </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                            <div id="edit" class="tab-pane">
                                <form class="form-horizontal" method="get">
                                    <h4 class="mb-xlg">
                                        个人信息
                                    </h4>
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileFirstName">
                                                真实姓名
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="profileFirstName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileLastName">
                                                昵称
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="profileLastName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileAddress">
                                                地址
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="profileAddress">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileCompany">
                                               公司
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="profileCompany">
                                            </div>
                                        </div>
                                    </fieldset>
                                    <hr class="dotted tall">
                                    <h4 class="mb-xlg">
                                        关于 自己
                                    </h4>
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileBio">
                                                传记信息
                                            </label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" rows="3" id="profileBio">
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label mt-xs pt-none">
                                                公开
                                            </label>
                                            <div class="col-md-8">
                                                <div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
                                                    <input type="checkbox" checked id="profilePublic">
                                                    <label for="profilePublic">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <hr class="dotted tall">
                                    <h4 class="mb-xlg">
                                        更改 密码
                                    </h4>
                                    <fieldset class="mb-xl">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileNewPassword">
                                                新 密码
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="profileNewPassword">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="profileNewPasswordRepeat">
                                                再输入一次
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="profileNewPasswordRepeat">
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary">
                                                    提交
                                                </button>
                                                <button type="reset" class="btn btn-default">
                                                    重写
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3">
                    <h4 class="mb-md">
                        积分 等级
                    </h4>
                    <!--积分池1-->

                                    <section class="panel">
                                        <div class="panel-body bg-primary">
                                            <div class="widget-summary">
                                                <div class="widget-summary-col widget-summary-col-icon">
                                                    <div class="summary-icon">
                                                        <i class="fa fa-life-ring"></i>
                                                    </div>
                                                </div>
                                                <div class="widget-summary-col">
                                                    <div class="summary">
                                                        <h4 class="title">Support Questions</h4>
                                                        <div class="info">
                                                            <strong class="amount">1281</strong>
                                                        </div>
                                                    </div>
                                                    <div class="summary-footer">
                                                        <a class="text-uppercase">(view all)</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                         
                    <!--第一个结束-->
                    <!-- 第二个 -->

                                    <section class="panel panel-featured-top panel-featured-primary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-primary">
                                                <i class="fa fa-life-ring"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Support Questions</h4>
                                                <div class="info">
                                                    <strong class="amount">1281</strong>
                                                    <span class="text-primary">(14 unread)</span>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase">(view all)</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                    <!-- 第二个结束 -->
                    <!-- 第三个 -->

                                    <section class="panel">
                                        <div class="panel-body bg-secondary">
                                            <div class="widget-summary">
                                                <div class="widget-summary-col widget-summary-col-icon">
                                                    <div class="summary-icon">
                                                        <i class="fa fa-life-ring"></i>
                                                    </div>
                                                </div>
                                                <div class="widget-summary-col">
                                                    <div class="summary">
                                                        <h4 class="title">Support Questions</h4>
                                                        <div class="info">
                                                            <strong class="amount">1281</strong>
                                                        </div>
                                                    </div>
                                                    <div class="summary-footer">
                                                        <a class="text-uppercase">(view all)</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                    <!-- 第三个结束 -->
                    <!-- 第四个开始 -->

                                    <section class="panel">
                                        <div class="panel-body bg-tertiary">
                                            <div class="widget-summary">
                                                <div class="widget-summary-col widget-summary-col-icon">
                                                    <div class="summary-icon">
                                                        <i class="fa fa-life-ring"></i>
                                                    </div>
                                                </div>
                                                <div class="widget-summary-col">
                                                    <div class="summary">
                                                        <h4 class="title">Support Questions</h4>
                                                        <div class="info">
                                                            <strong class="amount">1281</strong>
                                                        </div>
                                                    </div>
                                                    <div class="summary-footer">
                                                        <a class="text-uppercase">(view all)</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                    <!-- 第四个结束 -->
                    <ul class="simple-card-list mb-xlg">
                        <li class="primary">
                            <h3>
                                488
                            </h3>
                            <p>
                                加油！
                            </p>
                        </li>
                        <li class="primary">
                            <h3>
                               ￥2000
                            </h3>
                            <p>
                                努力！
                            </p>
                        </li>
                        <li class="primary">
                            <h3>
                                我帅吗！
                            </h3>
                            <p>
                                那是肯定的！
                            </p>
                        </li>
                    </ul>
                    <h4 class="mb-md">
                         项目
                    </h4>
                    <ul class="simple-bullet-list mb-xlg">
                        <li class="red">
                            <span class="title">
                             宅急送
                            </span>
                            <span class="description truncate">
                                框架架构
                            </span>
                        </li>
                        <li class="green">
                            <span class="title">
                                领英
                            </span>
                            <span class="description truncate">
                                博客API
                            </span>
                        </li>
                        <li class="blue">
                            <span class="title">
                               FACEBOOK
                            </span>
                            <span class="description truncate">
                               产品维护
                            </span>
                        </li>
                        <li class="orange">
                            <span class="title">
                               淘宝
                            </span>
                            <span class="description truncate">
                               数据分析
                            </span>
                        </li>
                    </ul>
                    <h4 class="mb-md">
                        消息
                    </h4>
                    <ul class="simple-user-list mb-xlg">
                        <li>
                            <figure class="image rounded">
                                <img src="pic/msg1.jpg" alt="Joseph Doe Junior" class="img-circle"   width="35px" height="35px">
                            </figure>
                            <span class="title">
                                金来沅
                            </span>
                            <span class="message">
                                有空Happy
                            </span>
                        </li>
                        <li>
                            <figure class="image rounded">
                                <img src="pic/msg2.jpg" alt="Joseph Junior" class="img-circle" width="35px" height="35px">
                            </figure>
                            <span class="title">
                                朴信惠
                            </span>
                            <span class="message">
                                你到底要不要娶我！
                            </span>
                        </li>
                        <li>
                            <figure class="image rounded">
                                <img src="pic/msg3.jpg" alt="Joe Junior" class="img-circle" width="35px" height="35px">
                            </figure>
                            <span class="title">
                                陈奕迅
                            </span>
                            <span class="message">
                               小周，有空来听演唱会
                            </span>
                        </li>
                        <li>
                            <figure class="image rounded">
                                <img src="pic/msg4.jpg" alt="Joseph Doe Junior" class="img-circle" width="35px" height="35px">
                            </figure>
                            <span class="title">
                               周杰伦
                            </span>
                            <span class="message">
                               兄弟，好久不联系了！
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end: page -->
        </section>
        
        <aside id="sidebar-right" class="sidebar-right">
            <div class="nano">
                <div class="nano-content">
                    <a href="#" class="mobile-close visible-xs">
                        Collapse
                        <i class="fa fa-chevron-right">
                        </i>
                    </a>
                    <div class="sidebar-right-wrapper">
                        <div class="sidebar-widget widget-calendar">
                            <h6>
                                Upcoming Tasks
                            </h6>
                            <div data-plugin-datepicker data-plugin-skin="dark">
                            </div>
                            <ul>
                                <li>
                                    <time datetime="2014-04-19T00:00+00:00">
                                        04/19/2014
                                    </time>
                                    <span>
                                        Company Meeting
                                    </span>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar-widget widget-friends">
                            <h6>
                                Friends
                            </h6>
                            <ul>
                                <li class="status-online">
                                    <figure class="profile-picture">
                                        <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">
                                            Joseph Doe Junior
                                        </span>
                                        <span class="title">
                                            Hey, how are you?
                                        </span>
                                    </div>
                                </li>
                                <li class="status-online">
                                    <figure class="profile-picture">
                                        <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">
                                            Joseph Doe Junior
                                        </span>
                                        <span class="title">
                                            Hey, how are you?
                                        </span>
                                    </div>
                                </li>
                                <li class="status-offline">
                                    <figure class="profile-picture">
                                        <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">
                                            Joseph Doe Junior
                                        </span>
                                        <span class="title">
                                            Hey, how are you?
                                        </span>
                                    </div>
                                </li>
                                <li class="status-offline">
                                    <figure class="profile-picture">
                                        <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">
                                            Joseph Doe Junior
                                        </span>
                                        <span class="title">
                                            Hey, how are you?
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </aside>
        
        <!-- Vendor -->
        
        <script src="<%=contextPath %>assets/vendor/jquery/jquery.js">
        </script>
        <script src="<%=contextPath %>assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js">
        </script>
        <script src="<%=contextPath %>assets/vendor/bootstrap/js/bootstrap.js">
        </script>
        <script src="<%=contextPath %>assets/vendor/nanoscroller/nanoscroller.js">
        </script>
        <script src="<%=contextPath %>assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js">
        </script>
        <script src="<%=contextPath %>assets/vendor/magnific-popup/magnific-popup.js">
        </script>
        <script src="<%=contextPath %>assets/vendor/jquery-placeholder/jquery.placeholder.js">
        </script>
        <!-- Specific Page Vendor -->
        <script src="<%=contextPath %>assets/vendor/jquery-autosize/jquery.autosize.js">
        </script>
       
        
         <script src="<%=contextPath %>assets/vendor/jquery-fileupload/jquery.ui.widget.js"></script>
        <script src="<%=contextPath %>assets/vendor/jquery-fileupload/jquery.iframe-transport.js"></script>
        <script src="<%=contextPath %>assets/vendor/jquery-fileupload/jquery.fileupload.js"></script>
    
        <script src="<%=contextPath %>admin/login/common.js"></script>
        <script src="<%=contextPath %>admin/login/userMenu.js"></script>
        
        
    </body>

</html>