<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    %><!DOCTYPE html>
<html>

<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>用户界面</title>

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

<script type="text/javascript" src="layout/js/main.js"></script>

<script type="text/javascript">
	jQuery(function () {
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<div class="wrapper sticky_footer">
		<!-- HEADER BEGIN -->
		<jsp:include page="header.jsp" flush="true"></jsp:include>
		<!-- HEADER END -->
		
		<!-- CONTENT BEGIN -->
		<div id="content" class="">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<p class="general_title">
							<span>用户登录</span>
						</p>
						<div class="separator" style="height: 39px;"></div>

						<div class="block_registration">
							<form action="#" class="w_validation" />
							<div class="col_1">
								<div class="label">
									<p>
										账号<span>*</span>:
									</p>
								</div>
								<div class="field">
									<input type="text" class="req" />
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height: 14px;"></div>

								<div class="label">
									<p>
										密码<span>*</span>:
									</p>
								</div>
								<div class="field">
									<input type="password" class="req" />
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height: 12px;"></div>

							</div>
							<div class="clearboth"></div>
							<div class="separator" style="height: 32px;"></div>
							<p class="info_text">
								<input type="submit" class="general_button"
									value="登录" />
							</p>
							</form>
						</div>

						<div class="line_3" style="margin: 42px 0px 0px;"></div>

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