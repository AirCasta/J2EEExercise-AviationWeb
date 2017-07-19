<%@page import="model.User"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title>BusinessNews</title>

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

<script>
	function refreshSlide(xmlHttp) {
		xmlHttp.open("GET", "NewsServlet?method=getSlide", true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = function() {
			//console.log(xmlHttp.readyState);
			//console.log(xmlHttp.status);
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var text = xmlHttp.responseText;
				var news = eval("(" + text + ")");
				var ul = document.getElementById("slide_list");
				var p = document.getElementById("hot_pot");
				var a = document.createElement("a");
				a.setAttribute("href", "NewsServlet?method=getDetailedNews&n_Id="
						+ news[0].n_Id);
				a.innerHTML = news[0].n_Name;
				p.appendChild(a);
				for (var i = 0; i < news.length; i++) {
					var li = document.createElement("li");
					var img = document.createElement("img");
					img.src = news[i].n_Address;
					var caption = document.createElement("div");
					caption.setAttribute("class", "caption");
					var title = document.createElement("p");
					title.setAttribute("class", "title");
					//console.log(news[i].n_Name);
					title.innerHTML = news[i].n_Name;
					caption.appendChild(title);
					var slide = document.createElement("div");
					slide.setAttribute("class", "slide");
					slide.appendChild(img);
					slide.appendChild(caption);
					li.appendChild(slide);
					ul.appendChild(li);
				}
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
			}
		}
	}
	function refreshNews(xmlHttp) {
		xmlHttp.open("GET", "NewsServlet?method=getIndexNews", true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var text = xmlHttp.responseText;
				var news = eval("(" + text + ")");
				var avi_news = document.getElementById("avi_news");
				avi_news.innerHTML = news[0].n_Content;
				var avi_infor = document.getElementById("avi_infor");
				avi_infor.innerHTML = news[1].n_Content;
				var newest_news = document.getElementById("newest_news");
				newest_news.innerHTML = news[2].n_Content;
			}
		}
	}
	function refreshEnterprise(xmlHttp) {
		xmlHttp.open("GET", "EnterpriseServlet?method=getIndexEnterprise",
						true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var text = xmlHttp.responseText;
				var enterprise = eval("(" + text + ")");
				var show = document.getElementById("enterprise_show");
				for (var i = 0; i < enterprise.length; i++) {
					var article = document.createElement("div");
					article.setAttribute("class", "article");
					var pic = document.createElement("div");
					pic.setAttribute("class", "pic");
					var w_hover = document.createElement("a");
					w_hover.setAttribute("href", "company_post.jsp");
					w_hover.setAttribute("class", "w_hover");
					var img = document.createElement("img");
					img.setAttribute("src", "images/pic_popular_post_1.jpg");
					img.setAttribute("alt", "");
					var span = document.createElement("span");
					w_hover.appendChild(img);
					w_hover.appendChild(span);
					pic.appendChild(w_hover);
					article.appendChild(pic);
					var text = document.createElement("div");
					text.setAttribute("class", "text");
					var title = document.createElement("p");
					title.setAttribute("class", "title");
					var a = document.createElement("a");
					a.setAttribute("href","<%=basePath%>EnterpriseServlet?method=getDetailedEnterprise&name="+enterprise[i].name);
					a.innerHTML = enterprise[i].name;
					title.appendChild(a);
					text.appendChild(title);
					article.appendChild(text);
					show.appendChild(article);
					var line_3 = document.createElement("div");
					line_3.setAttribute("class", "line_3");
					show.appendChild(line_3);
				}
			}
		}
	}
	function refreshProduct(xmlHttp) {
		xmlHttp.open("GET", "ProductServlet?method=getIndexProduct", true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var text = xmlHttp.responseText;
				var product = eval("(" + text + ")");
				var slide_product = document.getElementById("slide_product");
				//console.log(product.length);
				for (var i = 0; i < product.length; i++) {
					var li = document.createElement("li")
					li.style.cssText="width: 213px; float: left; display: block;";
					var block = document.createElement("div");
					block.setAttribute("class", "block_best_material_post");
					var f_pic = document.createElement("div");
					f_pic.setAttribute("class", "f_pic");
					var w_hover = document.createElement("a");
					w_hover.setAttribute("href", "<%=basePath%>ProductServlet?method=getDetailedProduct&p_id="+product[i].p_Id);
					w_hover.setAttribute("class", "w_hover");
					var img = document.createElement("img");
					img.setAttribute("src","<%=basePath%>"+product[i].p_Address);
					img.setAttribute("alt", "");
					var span = document.createElement("span");
					w_hover.appendChild(img);
					w_hover.appendChild(span);
					f_pic.appendChild(w_hover);
					block.appendChild(f_pic);
					var title = document.createElement("p");
					title.setAttribute("class", "title");
					var a = document.createElement("a");
					a.setAttribute("href", "<%=basePath%>ProductServlet?method=getDetailedProduct&p_id="+product[i].p_Id);
					a.innerHTML = product[i].p_Name;
					title.appendChild(a);
					block.appendChild(title);
					li.appendChild(block);
					slide_product.appendChild(li);
				}
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
			}
		}
	}
	function refreshAtlas(){
		$.ajax({
			url:"<%=basePath%>PhotoServlet?method=getIndexAtlas",
			type:"GET",
			async:true,
			success:function(result){
				var atlas=eval("(" + result + ")");
				
				<%-- <article class="block_media_post">
				<div class="f_pic">
					<a href="<%=basePath%>pic_post.jsp"><img
						src="images/pic_media_1.jpg" alt="" /><span class="hover"></span></a>
				</div>

				<p class="title">
					<a href="<%=basePath%>pic_post.jsp">用户推荐</a>
				</p>
			</article> --%>
				
				for(var i=0;i<atlas.length;i++){
					var href="<%=basePath%>PhotoServlet?method=getAtlasPhotos&atlas_Name="+atlas[i].atlas_Name;
					var img="<%=basePath%>"+atlas[i].ph_Address;
					var title=atlas[i].atlas_Name;
					$("#index_atlas").append("<article class=\"block_media_post\"><div class=\"f_pic\">"
					+"<a href=\""+href+"\"><img src=\""+img+"\" /><span class=\"hover\"></span></a></div>"
					+"<p class=\"title\"><a href=\""+href+"\">"+title+"</a></p></article>");
				}
			}
		})
	}
	window.onload = function() {
		var xmlHttp1 = createXMLHttpRequest();
		var xmlHttp2 = createXMLHttpRequest();
		var xmlHttp3 = createXMLHttpRequest();
		var xmlHttp4 = createXMLHttpRequest();
		refreshSlide(xmlHttp1);
		refreshNews(xmlHttp2);
		refreshEnterprise(xmlHttp3);
		refreshAtlas();
		refreshProduct(xmlHttp4);
		refreshNewsRank();
		refreshProjectShower();
	}
</script>
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
		<jsp:include page="header.jsp" flush="true" />
		<!-- HEADER END -->

		<!-- CONTENT BEGIN -->
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<div class="block_special_topic">
							<div class="type">
								<p>热点新闻</p>
							</div>
							<div class="title">
								<p id="hot_pot">
									<%-- <a href="<%=basePath%>#">long established fact that a reader be
										distracted.</a> --%>
								</p>
							</div>
						</div>
						<div class="separator" style="height: 17px;"></div>

						<div class="block_home_slider">
							<div id="home_slider" class="flexslider">
								<ul class="slides" id="slide_list">
									<!-- <li>
										<div class="slide">
											<img src="images/pic_home_slider_1.jpg" alt="" />
											<div class="caption">
												<p class="title">1111111111111111111111111111111</p>

											</div>
										</div>
									</li>

									<li>
										<div class="slide">
											<img src="images/pic_home_slider_2.jpg" alt="" />
											<div class="caption">
												<p class="title">22222222222222222222222222</p>
											</div>
										</div>
									</li>

									<li>
										<div class="slide">
											<img src="images/pic_home_slider_3.jpg" alt="" />
											<div class="caption">
												<p class="title">333333333333333333333333333333333</p>
												<p>There are many variations of passages of available,
													but the majority.</p>
											</div>
										</div>
									</li>

									<li>
										<div class="slide">
											<img src="images/pic_home_slider_4.jpg" alt="" />
											<div class="caption">
												<p class="title">444444444444444444444444444</p>
												<p>There are many variations of passages of available,
													but the majority have suffered alteration in some form, by
													injected humour, or randomised, but the majority have
													suffered alteration in some form, by injected humour, or
													randomised.</p>
											</div>
										</div>
									</li> -->
								</ul>
							</div>
						</div>

						<div class="line_2" style="margin: 34px 0px 28px;"></div>

						<div class="main_content">
							<h2>新闻资讯</h2>

							<div class="line_4" style="margin: 0px 0px 20px;"></div>

							<h5 style="padding-bottom: 11px;">航空新闻</h5>
							<p id="avi_news">
								<!-- Randomised words which don't look even slightly believable.
								If you are going to use a passage. You need to be sure there
								isn't anything embarrassing hidden in the middle of text
								established fact that a reader will be words which don't look
								even slightly believable. If you are going to use a passage. You
								need to be sure there isn't anything embarrassing hidden in the
								middle of textreadable content of a page. -->
							</p>

							<div class="line_2" style="margin: 3px 0px 20px;"></div>

							<h5 style="padding-bottom: 11px;">航空通知</h5>
							<p id="avi_infor">
								<!-- Randomised words which don't look even slightly believable.
								If you are going to use a passage. You need to be sure there
								isn't anything embarrassing hidden in the middle of text
								established fact that a reader will be words which don't look
								even slightly believable. If you are going to use a passage. You
								need to be sure there isn't anything embarrassing hidden in the
								middle of textreadable content of a page. -->
							</p>

							<div class="line_2" style="margin: 3px 0px 20px;"></div>

							<h5 style="padding-bottom: 11px;">最新新闻</h5>
							<p id="newest_news">
								<!-- Randomised words which don't look even slightly believable.
								If you are going to use a passage. You need to be sure there
								isn't anything embarrassing hidden in the middle of text
								established fact that a reader will be words which don't look
								even slightly believable. If you are going to use a passage. You
								need to be sure there isn't anything embarrassing hidden in the
								middle of textreadable content of a page. -->
							</p>

							<div class="line_2" style="margin: 3px 0px 0px;"></div>

						</div>

						<div class="line_3" style="margin: 14px 0px 13px;"></div>
						<a href="<%=basePath%>NewsServlet?method=getNewsList"
							class="lnk_all_news fl">更多新闻</a>
						<div class="clearboth"></div>
						<div class="line_3" style="margin: 13px 0px 35px;"></div>

						<div class="block_popular_posts" id="enterprise_show">
							<h2>企业信息</h2>

							<%-- <div class="article">
								<div class="pic">
									<a href="<%=basePath%>company_post.jsp" class="w_hover"> <img
										src="images/pic_popular_post_1.jpg" alt=""> <span></span>
									</a>
								</div>

								<div class="text">
									<p class="title">
										<a href="<%=basePath%>company_post.jsp">企业1信息</a>
									</p>
								</div>
							</div>
							<div class="line_3"></div>

							<div class="article">
								<div class="pic">
									<a href="<%=basePath%>company_post.jsp" class="w_hover"> <img
										src="images/pic_popular_post_2.jpg" alt=""> <span></span>
									</a>
								</div>

								<div class="text">
									<p class="title">
										<a href="<%=basePath%>company_post.jsp">企业2信息</a>
									</p>
								</div>
							</div>
							<div class="line_3"></div>

							<div class="article">
								<div class="pic">
									<a href="<%=basePath%>company_post.jsp" class="w_hover"> <img
										src="images/pic_popular_post_3.jpg" alt=""> <span></span>
									</a>
								</div>

								<div class="text">
									<p class="title">
										<a href="<%=basePath%>company_post.jsp">企业3信息</a>
									</p>
								</div>
							</div>
							<div class="line_3"></div>
 --%>
						</div>

						<div class="line_2" style="margin: 34px 0px 28px;"></div>

						<h3 style="font-size: 16px;">航空图集</h3>
						<div class="line_4" style="margin: -4px 0px 18px;"></div>

						<div class="block_media_posts" id="index_atlas">
							<%-- <article class="block_media_post">
								<div class="f_pic">
									<a href="<%=basePath%>pic_post.jsp"><img
										src="images/pic_media_1.jpg" alt="" /><span class="hover"></span></a>
									<span class="type">3 photos</span>
								</div>

								<p class="title">
									<a href="<%=basePath%>pic_post.jsp">用户推荐</a>
								</p>
							</article>

							<article class="block_media_post">
								<div class="f_pic">
									<a href="<%=basePath%>pic_post.jsp"><img
										src="images/pic_media_2.jpg" alt="" /><span class="hover"></span></a>
									<span class="type">5 photos</span>
								</div>

								<p class="title">
									<a href="<%=basePath%>pic_post.jsp">航空图集</a>
								</p>
							</article>

							<article class="block_media_post">
								<div class="f_pic">
									<a href="<%=basePath%>pic_post.jsp"><img
										src="images/pic_media_3.jpg" alt="" /><span class="hover"></span></a>
									<span class="type">5 Photo</span>
								</div>

								<p class="title">
									<a href="<%=basePath%>pic_post.jsp">空军图集</a>
								</p>
							</article>
							<article class="block_media_post">
								<div class="f_pic">
									<a href="<%=basePath%>pic_post.jsp"><img
										src="images/pic_media_1.jpg" alt="" /><span class="hover"></span></a>
									<span class="type">3 photos</span>
								</div>

								<p class="title">
									<a href="<%=basePath%>pic_post.jsp">历史图片</a>
								</p>
							</article>

							<article class="block_media_post">
								<div class="f_pic">
									<a href="<%=basePath%>pic_post.jsp"><img
										src="images/pic_media_2.jpg" alt="" /><span class="hover"></span></a>
									<span class="type">5 photos</span>
								</div>

								<p class="title">
									<a href="<%=basePath%>pic_post.jsp">航空模型</a>
								</p>
							</article> --%>
						</div>


						<div class="line_2" style="margin: 24px 0px 35px;"></div>

						<h3 style="font-size: 16px;">产品资讯</h3>
						<div class="line_4" style="margin: -4px 0px 18px;"></div>

						<div class="block_best_materials">
							<div class="slider">
								<div id="best_materials_slider" class="flexslider">
									<ul class="slides" id="slide_product">
										<%-- <li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>pro_post.jsp" class="w_hover"><img
														src="images/pic_home_best_materials_1.jpg" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>pro_post.jsp">产品属性1</a>
												</p>
											</div>
										</li>

										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>pro_post.jsp" class="w_hover"><img
														src="images/pic_home_best_materials_2.jpg" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>pro_post.jsp">产品属性2</a>
												</p>

											</div>
										</li>

										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>pro_post.jsp" class="w_hover"><img
														src="images/pic_home_best_materials_3.jpg" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>pro_post.jsp">产品属性3</a>
												</p>

											</div>
										</li>

										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>pro_post.jsp" class="w_hover"><img
														src="images/pic_home_best_materials_4.jpg" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>pro_post.jsp">产品属性4</a>
												</p>

											</div>
										</li>

										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>pro_post.jsp" class="w_hover"><img
														src="images/pic_home_best_materials_5.jpg" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>pro_post.jsp">产品属性5</a>
												</p>
											</div>
										</li>

										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="<%=basePath%>pro_post.jsp" class="w_hover"><img
														src="images/pic_home_best_materials_6.jpg" alt="" /><span></span></a>
												</div>
												<p class="title">
													<a href="<%=basePath%>pro_post.jsp">产品属性6</a>
												</p>
											</div>
										</li> --%>
									</ul>
								</div>
							</div>
						</div>

						<div class="line_2" style="margin: 20px 0px 0px;"></div>

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
			<a href="<%=basePath%>" class="close">Close</a>
			<div class="content">
				<div class="title">
					<p>Enter the site</p>
				</div>
				<p>${msg  }</p>
				<div class="form">
					<form action="UserServlet" method="post">
						<input type="hidden" name="method" value="login" />
						<div class="column">
							<p class="label">Login</p>
							<div class="field">
								<input type="text" name="u_Id" value="${form.u_Id}" />
							</div>
						</div>

						<div class="column">
							<p class="label">Password</p>
							<div class="field">
								<input type="password" name="u_Password"
									value="${form.u_Password}" />
							</div>
						</div>

						<div class="column_2">
							<div class="remember">
								<div class="checkbox">
									<input type="checkbox" name="remember" />
								</div>
								<div class="remember_label">
									<p>Remember me</p>
								</div>
							</div>
						</div>

						<div class="column_2">
							<p class="forgot_pass">
								<a href="<%=basePath%>">Forgot password?</a>
							</p>
						</div>

						<div class="column button">
							<input type="submit" class="enter" value="Login" />
						</div>
					</form>
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