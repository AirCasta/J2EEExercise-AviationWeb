<%@page import="model.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title>管理员界面--新闻信息添加或修改</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="<%=basePath%>layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="<%=basePath%>layout/style0.css"
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

<script type="text/javascript" src="<%=basePath%>layout/js/main.js"></script>

<script type="text/javascript">
	jQuery(function() {
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<div class="wrapper sticky_footer">
		<!-- HEADER BEGIN -->
		<jsp:include page="m_header.jsp" flush="true" />
		<!-- HEADER END -->

		<!-- CONTENT BEGIN -->
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<%
							News news = (News) request.getAttribute("news");
						%>
						<!-- Box -->
						<div class="box">
							<!-- Box Head -->
							<div class="box-head">
								<h2><%=(news == null ? "添加" : "更新")%>新闻
								</h2>
							</div>
							<!-- End Box Head -->
							<p>${msg }</p>
							<form
								action="<%=basePath%><%=(news == null ? "ManageAddNewsServlet" : "ManageNewsServlet?method=update")%>"
								method="post" enctype="multipart/form-data">
								<!-- Form -->
								<div class="form">
									<p>
										<label>新闻标题</label> <input class="field size1" type="text"
											name="n_Name" value="${news.getN_Name() }">
									</p>
									<p class="inline-field">
										<label>新闻属性</label> <input class="field size1" type="text"
											name="n_Attribute" value="${news.getN_Attribute() }">
									</p>
									<p>
										<label>新闻内容 </label>
										<textarea class="field size1" rows="10" cols="30" type="text"
											name="n_Content">${news.getN_Content() }</textarea>
									</p>
									<p>
										<label>新闻图片地址</label> <input class="field size1" type="file"
											name="n_address" value="${news.getN_Address() }">
									</p>
								</div>
								<!-- End Form -->
								<input type="hidden" name="n_Id" value="${news.getN_Id() }">
								<!-- Form Buttons -->
								<div class="buttons">
									<input class="button" value="提交" type="submit" />
								</div>
								<!-- End Form Buttons -->
							</form>
						</div>
						<!-- End Box -->

						<div class="line_2" style="margin: 20px 0px 0px;"></div>

					</div>
				</div>
			</div>
			<div class="clearboth"></div>
			<!-- CONTENT END -->

			<!-- FOOTER BEGIN -->
			<jsp:include page="footer.jsp" flush="true"></jsp:include>
			<!-- FOOTER END -->

		</div>
		<!-- POPUP BEGIN -->
		<div id="overlay"></div>
		<div id="login" class="block_popup">
			<div class="popup">
				<a href="<%=basePath%>#" class="close">关闭</a>
				<div class="content">
					<div class="title">
						<p>进入网站</p>
					</div>

					<div class="form">
						<form action="#" />
						<div class="column">
							<p class="label">用户名</p>
							<div class="field">
								<input type="text" />
							</div>
						</div>

						<div class="column">
							<p class="label">密码</p>
							<div class="field">
								<input type="password" />
							</div>
						</div>

						<div class="column button">
							<a href="<%=basePath%>#" class="enter"><span>登录</span></a>
						</div>

						<div class="clearboth"></div>
						</form>
					</div>

					<div class="subtitle">
						<p>注册成为用户</p>
					</div>
				</div>
			</div>
		</div>
		<!-- POPUP END -->
</body>
</html>