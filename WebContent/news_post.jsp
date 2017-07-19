<%@page import="model.NewsComment"%>
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

		<!-- CONTENT BEGIN -->
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<%
							News news = (News) request.getAttribute("news");
							SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM,yyyy");
						%>
						<div class="block_breadcrumbs">
							<ul>
								<li><a href="<%=basePath%>index.jsp">主页</a></li>
								<li><a href="<%=basePath%>NewsServlet?method=getNewsList">新闻资讯</a></li>
								<li><%=news.getN_Name()%></li>
							</ul>
						</div>
						<div class="separator" style="height: 30px;"></div>

						<article class="block_single_news">
							<div class="f_pic">
								<img src="<%=basePath + news.getN_Address()%>" alt="" />
							</div>
							<p class="title">
								<a><%=news.getN_Name()%></a>
							</p>
							<!--<p class="subtitle">Many variations of passages of available, but the majority have suffered alteration in some form. Humour, or randomised words which don't look even slightly believable.</p>-->
							<div class="info">
								<div class="date">
									<p><%=dateFormat.format(news.getCreate_Date())%></p>
								</div>

								<div class="r_part">
									<div class="category">
										<p>
											<a><%=news.getN_Attribute()%></a>
										</p>
									</div>

								</div>
							</div>

							<div class="content">
								<%-- <p>
									There are many variations of passages of available, but the
									majority have suffered alteration in some form, by injected
									humour, or <b>randomised words</b> which don't look even
									slightly believable. If you are going to use a passage of Lorem
									Ipsum, you need to be sure there isn't <a href="<%=basePath%>#"
										class="lnk_blue"><b>anything embarrassing hidden</b></a> in
									the middle of text. All the generators on the Internet tend to
									repeat predefined chunks as necessary, making this the first
									true generator on the Internet. It uses a dictionary of over
									words, combined with a handful of model sentence structures, to
									generate which looks reasonable. Theherefore <b>always free
										from repetition</b>, injected humour words etc.
								</p>
								<blockquote class="full">Going to use a passage you
									need to be sure there isn't anything embarrassing hidden in the
									middle of text. established fact that a reader will be
									distracted by the readable content.</blockquote>
								<p>
									Available, but the majority have suffered alteration.By
									injected humour, or randomised words which don't look even
									slightly believable. If you are <a href="<%=basePath%>#"><b>going
											to use a passage</b></a> of Lorem Ipsum, you need to be sure there
									isn't anything embarrassing hidden in the middle of text.
									Established fact that a reader will be distracted by the
									readable content of a page when <b>looking at its layout</b>.
									The point of using Lorem Ipsum is that it has a more-or-less.
								</p> --%>
								<p>
									<%=news.getN_Content()%>
								</p>
							</div>
						</article>

						<div class="separator" style="height: 4px;"></div>


						<div class="line_2" style="margin: 22px 0px 29px;"></div>

						<div class="block_related_posts">
							<h3>相关新闻</h3>

							<div class="block_main_news">
								<%
									List<News> relaNewsList = (List) request.getAttribute("relativeList");
									for (News n : relaNewsList) {
								%>
								<article class="block_news_post">
									<div class="f_pic">
										<a
											href="<%=basePath%>NewsServlet?method=getDetailedNews&n_Id=<%=n.getN_Id()%>"
											class="general_pic_hover scale_small"><img
											src="<%=basePath + n.getN_Address()%>" alt="" /></a>
									</div>
									<p class="category">
										<a
											href="<%=basePath%>NewsServlet?method=getDetailedNews&n_Id=<%=n.getN_Id()%>"><%=n.getN_Attribute()%></a>
									</p>
									<p class="title">
										<a
											href="<%=basePath%>NewsServlet?method=getDetailedNews&n_Id=<%=n.getN_Id()%>"><%=n.getN_Name()%></a>
									</p>
									<div class="info">
										<div class="date">
											<p><%=dateFormat.format(n.getCreate_Date())%></p>
										</div>
										<div class="clearboth"></div>
									</div>
								</article>
								<%
									}
								%>
								<div class="clearboth"></div>
							</div>
						</div>

						<div class="line_2" style="margin: 5px 0px 30px;"></div>

						<div class="block_comments_type_2">
							<h3><%=request.getAttribute("commentNum")%>
								Comments
							</h3>
							<%
								List<NewsComment> commentList = (List) request.getAttribute("commentList");
								for (NewsComment nc : commentList) {
							%>
							<div class="comment">
								<div class="userpic">
									<a><img src="images/ava_default_1.jpg" alt="" /></a>
								</div>

								<div class="comment_wrap">
									<div class="name">
										<p>
											<a><%=nc.getUserId()%></a>
										</p>
									</div>
									<!-- <div class="date">
										<p>Febr 16, 2012 at 4:43 pm</p>
									</div> -->
									<div class="content">
										<p><%=nc.getComment()%></p>
									</div>
								</div>
								<div class="clearboth"></div>
								<div class="line_3"></div>
							</div>
							<%
								}
							%>
						</div>

						<div class="separator" style="height: 30px;"></div>

						<div class="block_leave_reply">
							<h3>Leave a Reply</h3>

							<form class="w_validation" method="post"
								action="SendCommentServlet" id="add_comment">
								<p>
									Name<span>*</span>
								</p>
								<div class="field">
									<input type="text" class="req" name="u_Id" />
								</div>

								<p>Comment</p>
								<div class="textarea">
									<textarea cols="1" rows="1" name="comment"></textarea>
								</div>
								<input type="hidden" name="n_Id" value="<%=news.getN_Id()%>">
								<input type="hidden" name="category" value="news"> <input
									type="submit" class="general_button" value="Post comment" />
							</form>
						</div>
						<p id="responseMsg"></p>
					</div>
					<script type="text/javascript">
						$(function() {
							$("#add_comment").ajaxForm(function() {
								$("#responseMsg").text("提交成功");
							});
						});
					</script>
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