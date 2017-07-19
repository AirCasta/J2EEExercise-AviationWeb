<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Product"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    %><!DOCTYPE html>
<html>

<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>产品资讯</title>

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
<script type="text/javascript">
window.onload = function() {
	refreshNewsRank();
	refreshProjectShower();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<div class="wrapper sticky_footer">
    	<!-- HEADER BEGIN -->
		<jsp:include page="header.jsp" flush="true"></jsp:include>
		<!-- HEADER END -->
        <%
        	List<Product> timeProductList=(List)request.getAttribute("timeProudctList");
        	List<Product> clickProductList=(List)request.getAttribute("clickProudctList");
        	SimpleDateFormat dateFormat=new SimpleDateFormat("dd MMM,yyyy");
        %>
        <!-- CONTENT BEGIN -->
        <div id="content" class="right_sidebar">
        	<div class="inner">
            	<div class="general_content">
                	<div class="main_content">
                    	<div class="block_breadcrumbs">
                            <ul>
                            	<li><a href="<%=basePath%>index.jsp">主页</a></li>
                                <li>产品资讯</li>
                            </ul>
                        </div>
						<div class="separator" style="height: 17px;"></div>

						<h3 style="font-size: 16px;">产品资讯</h3>
						<div class="line_4" style="margin: -4px 0px 18px;"></div>

						<div class="block_best_materials">
							<div class="slider">
								<div id="best_materials_slider" class="flexslider">
									<ul class="slides">
										<%
											for(int i=0;i<Integer.min(6, timeProductList.size());i++){
										%>
										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>ProductServlet?method=getDetailedProduct&p_id=<%=timeProductList.get(i).getP_Id() %>" class="w_hover"><img
														src="<%=basePath+timeProductList.get(i).getP_Address() %>" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>ProductServlet?method=getDetailedProduct&p_id=<%=timeProductList.get(i).getP_Id() %>"><%=timeProductList.get(i).getP_Attribute() %></a>
												</p>
											</div>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>

							<script type="text/javascript">
								$(function() {
									$('#best_materials_slider').flexslider({
										animation : 'slide',
										controlNav : false,
										directionNav : true,
										animationLoop : false,
										slideshow : false,
										itemWidth : 213,
										itemMargin : 0,
										minItems : 1,
										maxItems : 3,
										move : 1,
										useCSS : false
									});
								});
							</script>
						</div>

						<div class="separator" style="height:31px;"></div>
                        
                        <div class="block_tabs_type_3">
                            <div class="tabs">
                                <ul>
                                    <li><a href="<%=basePath%>#1" class="current">最新发布</a></li><!-- tab link -->
                                    <li><a href="<%=basePath%>#2">人气最高</a></li><!-- tab link -->
                                </ul>
                            </div>
                                        
                            <div class="tab_content">
                                <!-- tab content goes here -->
                                <div class="block_media_posts_all">
                                	<%
                                		for(Product p:timeProductList){
                                	%>
                                	<article class="block_media_post_all">
                                    	<div class="f_pic">
                                            <a href="<%=basePath%>ProductServlet?method=getDetailedProduct&p_id=<%=p.getP_Id() %>"><img src="<%=basePath+p.getP_Address() %>" alt="" /><span class="hover"></span></a>
                                        </div>
                                        
                                      	<p class="title"><a href="<%=basePath%>ProductServlet?method=getDetailedProduct&p_id=<%=p.getP_Id() %>"><%=p.getP_Name() %></a></p>
                                        <p class="date"><%=dateFormat.format(p.getCreate_Date()) %></p>
                                    </article>
                                    <%
                                		}
                                    %>
                                </div>
                                
                                <div class="separator" style="height:12px;"></div>

                                
                                <div class="clearboth"></div>
                                
                                <div class="block_tabs_pager">
                                	<ul>
                                    	<li><a href="<%=basePath%>#">1</a></li>
                                        <li class="current"><a href="<%=basePath%>#">2</a></li>
                                        <li><a href="<%=basePath%>#">3</a></li>
                                        <li><a href="<%=basePath%>#">4</a></li>
                                        <li><a href="<%=basePath%>#">5</a></li>
                                        <li><a href="<%=basePath%>#">6</a></li>
                                        <li><a href="<%=basePath%>#">7</a></li>
                                        <li class="missed"><a href="<%=basePath%>#">...</a></li>
                                        <li><a href="<%=basePath%>#">26</a></li>
                                    </ul>
                                </div>
                            </div>
                                        
                            <div class="tab_content">
                                <!-- tab content goes here -->
                                <div class="block_media_posts_all">
                                	<%
                                		for(Product p:clickProductList){
                                	%>
                                	<article class="block_media_post_all">
                                    	<div class="f_pic">
                                            <a href="<%=basePath%>ProductServlet?method=getDetailedProduct&p_id=<%=p.getP_Id() %>"><img src="<%=basePath+p.getP_Address() %>" alt="" /><span class="hover"></span></a>                                        </div>
                                        
                                      	<p class="title"><a href="<%=basePath%>ProductServlet?method=getDetailedProduct&p_id=<%=p.getP_Id() %>"><%=p.getP_Name() %></a></p>
                                        <p class="date">11 July, 2012</p>
                                    </article>
                                    <%
                                		}
                                    %>
                                </div>
                                
                                <div class="separator" style="height:12px;"></div>
                                
                                <div class="clearboth"></div>
                            </div>
                                        
                            <script type="text/javascript">
                                $('.block_tabs_type_3 .tabs').tabs('.block_tabs_type_3 .tab_content', {
                                    initialIndex : 0
                                });
                            </script>
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