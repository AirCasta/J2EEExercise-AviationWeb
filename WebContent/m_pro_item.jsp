<%@page import="model.Product"%>
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
<title>管理员界面--产品信息添加或修改</title>

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
							Product product = (Product) request.getAttribute("product");
						%>
						<!-- Box -->
						<div class="box">
							<!-- Box Head -->
							<div class="box-head">
								<h2><%=(product == null ? "添加" : "修改")%>信息
								</h2>
							</div>
							<!-- End Box Head -->
							<p>${msg }</p>
							<form
								action="<%=basePath%><%=(product == null ? "ManageAddProServlet" : "ManageProServlet?method=update")%>"
								method="post" enctype="multipart/form-data">

								<!-- Form -->
								<div class="form">
									<p>
										<label>产品名 </label> <input class="field size1" type="text"
											name="p_Name" value="${product.getP_Name() }">
									</p>
									<p>
										<label>产品属性 </label> <input class="field size1" type="text"
											name="p_Attribute" value="${product.getP_Attribute() }">
									</p>
									<p>
										<label>产品内容 </label><input class="field size1" type="text"
											name="p_Content" value="${product.getP_Content() }">
									</p>
									<p>
										<label>产品图片地址 </label> <input class="field size1" type="file"
											name="p_Address" value="${product.getP_Address() }">
									</p>
									<input type="hidden" name="p_Id" value="${product.getP_Id()}" >
								</div>
								<!-- End Form -->

								<!-- Form Buttons -->
								<div class="buttons">
									<input class="button" value="提交" type="submit">
								</div>
								<!-- End Form Buttons -->
							</form>
						</div>
						<!-- End Box -->

					</div>
					<div class="line_2" style="margin: 3px 0px 0px;"></div>

				</div>
				<div class="clearboth"></div>
				<div class="line_3" style="margin: 13px 0px 35px;"></div>


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
			<a href="#" class="close">关闭</a>
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
						<a href="#" class="enter"><span>登录</span></a>
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