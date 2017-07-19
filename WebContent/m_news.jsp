<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.News"%>
<%@page import="java.util.List"%>
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
<title>管理员界面--新闻信息</title>

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

						<!-- Box -->
						<div class="box">
							<!-- Box Head -->
							<div class="box-head">
								<h2 class="left">新闻信息</h2>
								<div class="right">
									<label>搜索信息</label> <input class="field small-field"
										type="text"> <input class="button" value="搜索"
										type="submit">
								</div>
							</div>
							<!-- End Box Head -->

							<!-- Table -->
							<div class="table">
								<table width="100%" cellspacing="0" cellpadding="0" border="0">
									<tbody>
										<tr>
											<th>新闻标题</th>
											<th>新闻内容</th>
											<th>新闻图片</th>
											<th>日期</th>
											<th class="ac" width="110">编辑</th>
										</tr>
										<%
											List<News> newsList = (List) request.getAttribute("news_list");
											SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
											News news = null;
											for (int i = 0; i < newsList.size(); i++) {
												news = newsList.get(i);
										%>
										<tr>
											<td><%=news.getN_Name()%></td>
											<td><%=news.getN_Attribute()%></td>
											<td><%=news.getN_Address()%></td>
											<td><%=dateFormat.format(news.getCreate_Date())%></td>
											<td><a
												href="<%=basePath%>ManageNewsServlet?method=delete&n_Id=<%=news.getN_Id()%>"
												class="ico del">删除</a> <a
												href="<%=basePath%>ManageNewsServlet?method=edit&n_Id=<%=news.getN_Id()%>"
												class="ico edit">编辑</a></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>


								<!-- Pagging -->
								<div class="pagging">
									<div class="right">
										<a href="<%=basePath%>#">上一页</a> <a href="<%=basePath%>#">1</a>
										<a href="<%=basePath%>#">2</a> <a href="<%=basePath%>#">3</a>
										<a href="<%=basePath%>#">4</a> <a href="<%=basePath%>#">5</a>
										<span>...</span> <a href="<%=basePath%>#">下一页</a>
									</div>
								</div>
								<!-- End Pagging -->

							</div>
							<!-- Table -->

						</div>
						<!-- End Box -->
						<div class="separator" style="height: 17px;"></div>
						<a href="<%=basePath%>m_news_item.jsp">添加新闻</a>
					</div>
					<div class="line_2" style="margin: 3px 0px 0px;"></div>
				</div>
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