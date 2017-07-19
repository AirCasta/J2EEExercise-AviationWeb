<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<title>Manager Header</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="<%=basePath%>layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="<%=basePath%>layout/style0.css" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=PT+Sans:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic"
	rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath%>layout/js/jquery.js"></script>

<!-- PrettyPhoto start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/prettyphoto/css/prettyPhoto.css" type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto end -->

<!-- jQuery tools start -->
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/tools/jquery.tools.min.js"></script>
<!-- jQuery tools end -->

<!-- Calendar start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/calendar/calendar.css"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>layout/plugins/calendar/calendar.js"></script>
<!-- Calendar end -->

<!-- ScrollTo start -->
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/scrollto/jquery.scroll.to.min.js"></script>
<!-- ScrollTo end -->

<!-- MediaElements start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/video-audio/mediaelementplayer.css" />
<script src="<%=basePath%>layout/plugins/video-audio/mediaelement-and-player.js"></script>
<!-- MediaElements end -->

<!-- FlexSlider start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/flexslider/flexslider.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/flexslider/jquery.flexslider-min.js"></script>
<!-- FlexSlider end -->

<!-- iButtons start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/ibuttons/css/jquery.ibutton.css" type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/ibuttons/lib/jquery.ibutton.min.js"></script>
<!-- iButtons end -->

<!-- jQuery Form Plugin start -->
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/ajaxform/jquery.form.js"></script>
<!-- jQuery Form Plugin end -->

<script type="text/javascript" src="<%=basePath%>layout/js/main.js"></script>

<script type="text/javascript">
	jQuery(function() {
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<!-- HEADER BEGIN -->
		<header>
			<div id="header">
				<section class="top">
					<div class="inner">
						<div class="fl">
							<div class="block_top_menu">
								<ul>
									<li class="current"><a href="<%=basePath%>index.jsp">主页</a></li>
									<li><a href="<%=basePath%>NewsServlet?method=getNewsList">新闻资讯</a></li>
									<li><a href="<%=basePath%>EnterpriseServlet?method=getEnterpriseList">企业信息</a></li>
									<li><a href="<%=basePath%>ProductServlet?method=getProductList">产品资讯</a></li>
									<li><a href="<%=basePath%>pic.jsp">航空图集</a></li>
								</ul>
							</div>
						</div>

						<div class="fr">
							<div class="block_top_menu">
								<ul>
									<%
										if(session.getAttribute("loginManager")==null){
									%>
									<li class="current"><a href="<%=basePath%>#login" class="open_popup">登录</a></li>
									<li><a href="<%=basePath%>registration.jsp">注册</a></li>
									<li><a href="<%=basePath%>manage.jsp">管理员界面</a></li>
									<% 
										}else{
									%>
									<li><a>您好，管理员${sessionScope.loginManager.m_Name }</a></li>
									<li><a href="<%=basePath%>ManagerServlet?method=quit">退出</a></li>
									<%
										}
									%>
								</ul>
							</div>
						</div>

						<div class="clearboth"></div>
					</div>
				</section>

				<section class="bottom">
					<div class="inner">
						<div id="logo_top">
							<a href="<%=basePath%>index.jsp"><img src="<%=basePath%>images/logo_top.png"
								alt="BusinessNews" title="BusinessNews" /></a>
						</div>

						<div class="block_today_date">
							<div class="num">
								<p id="num_top" />
							</div>
							<div class="other">
								<p class="month_year">
									<span id="month_top"></span>, <span id="year_top"></span>
								</p>
								<p id="day_top" class="day" />
							</div>
						</div>

						<div class="clearboth"></div>
					</div>
				</section>

				<section class="section_main_menu">
					<div class="inner">
						<nav class="main_menu">
							<ul>

								<li class="big_dropdown" data-content="news"><a
									href="<%=basePath%>ManageNewsServlet?method=queryAll">新闻信息</a></li>
								<li class="big_dropdown" data-content="company"><a
									href="<%=basePath%>ManageCompServlet?method=queryAll">企业信息</a></li>
								<li class="big_dropdown" data-content="pro"><a
									href="<%=basePath%>ManageProServlet?method=queryAll">产品信息</a></li>
								<li class="big_dropdown" data-content="pic"><a
									href="<%=basePath%>ManagePicServlet?method=queryAll">图集信息</a></li>

							</ul>
						</nav>
					</div>
				</section>
			</div>
		</header>
<!-- HEADER END -->
</body>
</html>