<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>Header</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="<%=basePath%>layout/style.css" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath%>layout/js/jquery.js"></script>

<!-- PrettyPhoto start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/prettyphoto/css/prettyPhoto.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto end -->

<!-- jQuery tools start -->
<script type="text/javascript" src="<%=basePath%>layout/plugins/tools/jquery.tools.min.js"></script>
<!-- jQuery tools end -->

<!-- Calendar start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/calendar/calendar.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>layout/plugins/calendar/calendar.js"></script>
<!-- Calendar end -->

<!-- ScrollTo start -->
<script type="text/javascript" src="<%=basePath%>layout/plugins/scrollto/jquery.scroll.to.min.js"></script>
<!-- ScrollTo end -->

<!-- MediaElements start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/video-audio/mediaelementplayer.css" />
<script src="<%=basePath%>layout/plugins/video-audio/mediaelement-and-player.js"></script>
<!-- MediaElements end -->

<!-- FlexSlider start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/flexslider/flexslider.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>layout/plugins/flexslider/jquery.flexslider-min.js"></script>
<!-- FlexSlider end -->

<!-- iButtons start -->
<link rel="stylesheet" href="<%=basePath%>layout/plugins/ibuttons/css/jquery.ibutton.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>layout/plugins/ibuttons/lib/jquery.ibutton.min.js"></script>
<!-- iButtons end -->

<!-- jQuery Form Plugin start -->
<script type="text/javascript" src="<%=basePath%>layout/plugins/ajaxform/jquery.form.js"></script>
<!-- jQuery Form Plugin end -->

<script type="text/javascript" src="<%=basePath%>layout/js/main.js"></script>

<script type="text/javascript">
	jQuery(function () {
	});
</script>
<script>
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();
		} catch (e) {
			try {
				return new ActiveXObject("Msxm12.XMLHttp");
			} catch (e) {
				try {
					return new ActiveXObject("Microsoft.XMLHttp");
				} catch (e) {
					throw e;
				}
			}
		}
	}
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
								<%if(session.getAttribute("loginUser")==null){ %>
									<li class="current"><a href="#login" class="open_popup">登录</a></li>
									<li><a href="<%=basePath%>registration.jsp">注册</a></li>
									<li><a href="<%=basePath%>manage.jsp">管理员界面</a></li>
								<%}else{ %>
									<li><a>您好，${sessionScope.loginUser.u_Name }</a></li>
									<li><a href="<%=basePath%>UserServlet?method=quit">退出</a></li>
								<%} %>
								</ul>
							</div>
						</div>

						<div class="clearboth"></div>
					</div>
				</section>

				<section class="bottom">
					<div class="inner">
						<div id="logo_top">
							<a href="<%=basePath%>index.jsp"><img src="images/logo_top.png"
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
								<li class="current_page_item"><a href="<%=basePath%>index.jsp">主页</a></li>
								<li class="big_dropdown" data-content="business"><a
									href="<%=basePath%>NewsServlet?method=getNewsList">新闻资讯</a></li>
								<li class="big_dropdown" data-content="technology"><a
									href="<%=basePath%>EnterpriseServlet?method=getEnterpriseList">企业信息</a></li>
								<li class="big_dropdown" data-content="education"><a
									href="<%=basePath%>ProductServlet?method=getProductList">产品资讯</a></li>
								<li class="big_dropdown" data-content="education"><a
									href="<%=basePath%>PhotoServlet?method=getAtlasList">航空图集</a></li>

							</ul>
						</nav>
					</div>
				</section>
			</div>
		</header>
	</body>
</html>