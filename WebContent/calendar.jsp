<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<title>Calendar</title>

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
	<div class="block_calendar">
		<h4>Calendar</h4>

		<div class="calendar" id="calendar_sidebar"></div>

		<script type="text/javascript">
			var today = new Date();
			var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
					+ today.getDate();
			$('#calendar_sidebar')
					.DatePicker(
							{
								flat : true,
								date : date,
								calendars : 1,
								starts : 1,
								locale : {
									days : [ 'Sunday', 'Monday', 'Tuesday',
											'Wednesday', 'Thursday', 'Friday',
											'Saturday', 'Sunday' ],
									daysShort : [ 'Sun', 'Mon', 'Tue', 'Wed',
											'Thu', 'Fri', 'Sat', 'Sun' ],
									daysMin : [ 'S', 'M', 'T', 'W', 'T', 'F',
											'S', 'S' ],
									months : [ 'January', 'February', 'March',
											'April', 'May', 'June', 'July',
											'August', 'September', 'October',
											'November', 'December' ],
									monthsShort : [ 'Jan', 'Feb', 'Mar', 'Apr',
											'May', 'Jun', 'Jul', 'Aug', 'Sep',
											'Oct', 'Nov', 'Dec' ],
									weekMin : 'wk'
								}
							});
		</script>

		<div class="line_2"></div>
	</div>
</body>
</html>