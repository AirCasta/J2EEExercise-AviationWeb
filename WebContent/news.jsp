<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.News"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%><!DOCTYPE html>
<html>

<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title>新闻资讯</title>

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
			List<News> newsList = (List<News>) request.getAttribute("NewsList");
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM,yyyy");
		%>
		<!-- CONTENT BEGIN -->
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<div class="block_breadcrumbs">
							<ul>
								<li><a href="<%=basePath%>index.jsp">主页</a></li>
								<li>新闻资讯</li>
							</ul>
						</div>
						<div class="separator" style="height: 17px;"></div>

						<div class="block_home_slider">
							<div id="home_slider" class="flexslider">
								<ul class="slides">
									<%
										int len = Integer.min(5, newsList.size());
										for (int i = 0; i < len; i++) {
									%>
									<li>
										<div class="slide">
											<img src="<%=basePath + newsList.get(i).getN_Address()%>"
												alt="" />
											<div class="caption">
												<p class="title">
													<%=newsList.get(i).getN_Name()%>
												</p>
											</div>
										</div>
									</li>
									<%
										}
									%>
								</ul>
							</div>

							<script type="text/javascript">
								$(function() {
									$('#home_slider').flexslider({
										animation : 'slide',
										controlNav : true,
										directionNav : true,
										animationLoop : true,
										slideshow : false,
										useCSS : false
									});

								});
							</script>
						</div>

						<div class="separator" style="height: 50px;"></div>

						<article class="block_topic_post_feature">
							<%
								
							%>
							<div class="content">
								<p class="title">
									<a
										href="<%=basePath%>NewsServlet?method=getDetailedNews&n_Id=<%=newsList.get(0).getN_Id()%>"><%=newsList.get(0).getN_Name()%></a>
								</p>

								<div class="info">
									<div class="date">
										<p><%=dateFormat.format(newsList.get(0).getCreate_Date())%></p>
									</div>

									<div class="r_part">
										<div class="category">
											<p><%=newsList.get(0).getN_Attribute()%></p>
										</div>
									</div>
								</div>

								<p class="text"><%=newsList.get(0).getN_Content()%></p>
							</div>

							<div class="clearboth"></div>
						</article>

						<div class="line_2" style="margin: 21px 0px 21px;"></div>

						<div class="block_topic_news">
							<%
								for (News n : newsList) {
							%>
							<article class="block_topic_post">
								<p class="title">
									<a
										href="<%=basePath%>NewsServlet?method=getDetailedNews&n_Id=<%=n.getN_Id()%>"><%=n.getN_Name()%></a>
								</p>
								<div class="f_pic">
									<a
										href="<%=basePath%>NewsServlet?method=getDetailedNews&n_Id=<%=n.getN_Id()%>"
										class="general_pic_hover scale"><img
										src="<%=basePath + n.getN_Address()%>" alt="" /></a>
								</div>
								<%-- 	<p class="text"><%=n.getN_Content() %></p>    --%>
								<div class="info">
									<div class="date">
										<p><%=dateFormat.format(n.getCreate_Date())%></p>
									</div>

									<div class="r_part">
										<div class="category">
											<p><%=n.getN_Attribute()%></p>
										</div>
									</div>
								</div>
							</article>
							<%
								}
							%>
						</div>

						<div class="line_2" style="margin: 25px 0px 25px;"></div>

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