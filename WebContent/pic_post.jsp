<%@page import="model.Photo"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%><!DOCTYPE html>
<html>

<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title>新闻资讯- News Name</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="<%=basePath%>layout/style.css"
	type="text/css" />
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
	href="<%=basePath%>layout/plugins/prettyphoto/css/prettyPhoto.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto end -->

<!-- jQuery tools start -->
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/tools/jquery.tools.min.js"></script>
<!-- jQuery tools end -->

<!-- Calendar start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/calendar/calendar.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/calendar/calendar.js"></script>
<!-- Calendar end -->

<!-- ScrollTo start -->
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/scrollto/jquery.scroll.to.min.js"></script>
<!-- ScrollTo end -->

<!-- MediaElements start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/video-audio/mediaelementplayer.css" />
<script
	src="<%=basePath%>layout/plugins/video-audio/mediaelement-and-player.js"></script>
<!-- MediaElements end -->

<!-- FlexSlider start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/flexslider/flexslider.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/flexslider/jquery.flexslider-min.js"></script>
<!-- FlexSlider end -->

<!-- iButtons start -->
<link rel="stylesheet"
	href="<%=basePath%>layout/plugins/ibuttons/css/jquery.ibutton.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/ibuttons/lib/jquery.ibutton.min.js"></script>
<!-- iButtons end -->

<!-- jQuery Form Plugin start -->
<script type="text/javascript"
	src="<%=basePath%>layout/plugins/ajaxform/jquery.form.js"></script>
<!-- jQuery Form Plugin end -->

<script type="text/javascript" src="layout/js/main.js"></script>

<script type="text/javascript">
	jQuery(function() {
	});
</script>
<script type="text/javascript">
window.onload = function() {
	refreshNewsRank();
	refreshProjectShower();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<div class="wrapper sticky_footer">
		<!-- HEADER BEGIN -->
		<jsp:include page="header.jsp" flush="true"></jsp:include>
		<!-- HEADER END -->
		<%
			List<Photo> photoList = (List) request.getAttribute("AtlasPhotos");
		%>
		<!-- CONTENT BEGIN -->
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<div class="block_breadcrumbs">
							<ul>
								<li><a href="<%=basePath%>index.jsp">主页</a></li>
								<li><a href="<%=basePath%>news.jsp">航空图集</a></li>
								<li><%=photoList.get(0).getAtlas_Name()%></li>
							</ul>
						</div>
						<div class="separator" style="height: 30px;"></div>


						<div class="block_topic_news">
							<%
								for (Photo p : photoList) {
							%>
							<article class="block_topic_post">
								<div class="f_pic">
									<a 
										class="general_pic_hover scale"><img
										src="<%=basePath+p.getPh_Address() %>" alt="" /></a>
								</div>
								<div class="info">
									<div class="r_part">
										<div class="category">
											<p><%=p.getPh_Attribute()%></p>
										</div>
									</div>
								</div>
							</article>
							<%
								}
							%>
						</div>
					</div>
					<div class="sidebar">
							<div class="separator" style="height: 31px;"></div>
							<jsp:include page="calendar.jsp"></jsp:include>
							<div class="separator" style="height: 31px;"></div>
							<jsp:include page="project_shower.jsp"></jsp:include>
							<div class="separator" style="height: 31px;"></div>
							<jsp:include page="news_rank.jsp"></jsp:include>
						</div>
					<div class="clearboth"></div>
				</div>
			</div>
			<!-- CONTENT END -->

			<!-- FOOTER BEGIN -->
			<jsp:include page="footer.jsp" flush="true"></jsp:include>
			<!-- FOOTER END -->
		</div>

		<!-- POPUP BEGIN -->
		<div id="overlay"></div>
		<div id="login" class="block_popup">
			<div class="popup">
				<a href="<%=basePath%>#" class="close">Close</a>
				<div class="content">
					<div class="title">
						<p>Enter the site</p>
					</div>

					<div class="form">
						<form action="#" />
						<div class="column">
							<p class="label">Login</p>
							<div class="field">
								<input type="text" />
							</div>
						</div>

						<div class="column">
							<p class="label">Password</p>
							<div class="field">
								<input type="password" />
							</div>
						</div>

						<div class="column_2">
							<div class="remember">
								<div class="checkbox">
									<input type="checkbox" />
								</div>
								<div class="remember_label">
									<p>Remember me</p>
								</div>
							</div>
						</div>

						<div class="column_2">
							<p class="forgot_pass">
								<a href="<%=basePath%>#">Forgot password?</a>
							</p>
						</div>

						<div class="column button">
							<a href="<%=basePath%>#" class="enter"><span>Login</span></a>
						</div>

						<div class="clearboth"></div>
						</form>
					</div>

					<div class="subtitle">
						<p>SIGN IN AS A USER</p>
					</div>
				</div>
			</div>
		</div>
		<!-- POPUP END -->
</body>
</html>