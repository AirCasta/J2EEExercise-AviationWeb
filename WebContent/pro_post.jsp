<%@page import="model.ProductComment"%>
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
<title>产品资讯- Product Name</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="layout/style.css" type="text/css" />
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
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="right_sidebar">
        	<div class="inner">
            	<div class="general_content">
                	<div class="main_content">
                    	<div class="block_breadcrumbs">
                    	<%
                        	Product product=(Product)request.getAttribute("product");
                        	SimpleDateFormat dateFormat=new SimpleDateFormat("dd MMM,yyyy");
                        %>
                            <ul>
                            	<li><a href="index.jsp">主页</a></li>
                                <li><a href="news.jsp">产品资讯</a></li>
                                <li><%=product.getP_Name() %></li>
                            </ul>
                        </div>
                        <div class="separator" style="height:30px;"></div>
                        <article class="block_single_news">
                        	<div class="f_pic"><a ><img src="<%=basePath+product.getP_Address() %>" alt="" /></a></div>
                          <p class="title"><a ><%=product.getP_Name() %></a></p>
                            
                            <div class="info">
                                <div class="date"><p><%=dateFormat.format(product.getCreate_Date()) %></p></div>
                                    
                            	<div class="r_part">
                                	<div class="category"><p><a ><%=product.getP_Attribute() %></a></p></div>

                                </div>
                            </div>
                            
                            <div class="content">
                            	<p>产品介绍</p>
                            	<p><%=product.getP_Content() %></p>
                            </div>
                        </article>
                        
                        <div class="separator" style="height:4px;"></div>                  
 
                        <div class="line_2" style="margin:22px 0px 30px;"></div>
                        
                        <div class="block_comments_type_2">
                        	
                        	<h3><%=request.getAttribute("commentNum") %> Comments</h3>
                            <%
                        		List<ProductComment> commentList=(List)request.getAttribute("commentList");
                        		for(ProductComment pc:commentList){
                        	%>
                            <div class="comment">
                            	<div class="userpic"><a ><img src="images/ava_default_1.jpg" alt="" /></a></div>
                                
                                <div class="comment_wrap">
                                    <div class="name"><p><a ><%=pc.getUserId() %></a></p></div>
                                    <div class="content">
                                        <p><%=pc.getComment() %></p>
                                    </div>
                                </div>
                                <div class="clearboth"></div>
                                <div class="line_3"></div>
                            </div>
                            <%
                            	}
                            %>
                        </div>
                        
                        <div class="separator" style="height:30px;"></div>
                        
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
								<input type="hidden" name="p_Id"
									value="<%=product.getP_Id() %>"> <input
									type="hidden" name="category" value="product"> <input
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
			<a href="#" class="close">Close</a>
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
							<a href="#">Forgot password?</a>
						</p>
					</div>

					<div class="column button">
						<a href="#" class="enter"><span>Login</span></a>
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