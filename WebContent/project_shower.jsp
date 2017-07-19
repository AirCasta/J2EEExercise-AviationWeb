<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<title>Project Shower</title>

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
	jQuery(function () {
	});
</script>
<script type="text/javascript">
	function refreshProjectShower(){
		var xmlHttp = createXMLHttpRequest();
		xmlHttp.open("GET", "ProductServlet?method=getStarProduct", true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var text = xmlHttp.responseText;
			var product = eval("(" + text + ")");
			console.log(product[1].create_Date);
			$("#newest").find(".w_hover").attr("href","<%=basePath%>ProductServlet?method=getDetailedProduct&p_id="+product[0].p_Id);		
			$("#newest").find(".title").find("a").attr("href","<%=basePath%>ProductServlet?method=getDetailedProduct&p_id="+product[1].p_Id);
			$("#newest").find(".title").find("a").text(product[0].p_Name);
			$("#newest").find(".date").find("p").text(product[0].create_Date);			
			$("#hottest").find(".w_hover").attr("href","<%=basePath%>ProductServlet?method=getDetailedProduct&p_id="+product[1].p_Id);
			$("#hottest").find(".title").find("a").attr("href","<%=basePath%>ProductServlet?method=getDetailedProduct&p_id="+product[1].p_Id);
			$("#hottest").find(".title").find("a").text(product[1].p_Name);
			$("#hottest").find(".date").find("p").text(product[1].create_Date);
		}
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="block_popular_posts">
		<h4>产品展示</h4>

		<div class="article" id="newest">
			<div class="pic">
				<a href="<%=basePath%>#" class="w_hover" > <img
					src="images/pic_popular_post_1.jpg" alt="" /> <span></span>
				</a>
			</div>

			<div class="text">
				<p class="title">
					<a href="<%=basePath%>#">最新发布产品</a>
				</p>
				<div class="date">
					<p>11 July, 2012</p>
				</div>
			</div>
		</div>
		<div class="line_3"></div>

		<div class="article" id="hottest">
			<div class="pic">
				<a href="<%=basePath%>#" class="w_hover"> <img
					src="images/pic_popular_post_2.jpg" alt="" /> <span></span>
				</a>
			</div>

			<div class="text">
				<p class="title">
					<a href="<%=basePath%>#">人气最高产品</a>
				</p>
				<div class="date">
					<p>07 July, 2012</p>
				</div>

			</div>
		</div>
		<div class="line_2"></div>
	</div>
</body>
</html>