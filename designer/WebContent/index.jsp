<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="cn.edu.zjut.service.IAdminService" %>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="cn.edu.zjut.dao.IExamplePictureDAO" %>
<%@ page import="cn.edu.zjut.po.Designer" %>
<%@ page import="cn.edu.zjut.po.Example" %>
<%@ page import="cn.edu.zjut.po.ExamplePicture" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>首 页</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
</head>

<body>
	<!-- banner -->
	<div class="banner jarallax">
		<div class="agile_dot_info one">
			<div class="container">
				<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<h1>
						<a class="navbar-brand" href="index.html" style="font-size: 30px;">初见室内设计交易平台</a>
					</h1>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right"
					id="bs-example-navbar-collapse-1">
					<nav class="link-effect-8" id="link-effect-8">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.html">首页</a></li>
						<li><a href="findAllExample">看案例</a></li>
						<li><a href="findneeds">找需求</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">装修攻略 <b class="caret"></b></a>
							<ul class="dropdown-menu agile_short_dropdown">
								<li><a href="icons.html">问答</a></li>
								<li><a href="typography.html">装修宝典</a></li>
							</ul></li>
						<s:if test="%{#session.id==null}">
							<li><a href="login.jsp">登陆</a></li>
							<li><a href="contact.html">注册</a></li>
						</s:if>
						
						<s:else>
						
							
						  <s:if test="%{#session.designer!=null}">
						  <li><a href="judge.action" target="_Blank">个人主页</a>
							</li>
							<li><a href="designerIndex.jsp">个人中心</a></li>
						  </s:if>
						  <s:elseif test="%{#session.employer!=null}">
						 
							<li><a href="employerIndex.jsp">个人中心</a></li>
						  </s:elseif>
						   <s:elseif test="%{#session.admin!=null}">
						 
							<li><a href="authentication.jsp">个人中心</a></li>
						  </s:elseif>
						</s:else>
						
						
						
							
							
					</ul>
					</nav>
				</div>
				</nav>

				<div class="w3_agile_banner_info">
					<div class="maintitle">
						<p>发布项目，按需雇佣设计师</p>
						<p>1小时内对接设计师</p>
					</div>
					<div class="mainbutton">

						<s:if test="%{#session.designer!=null}">
							<a href="findneeds"><input class="button button_border"
								type="button" value="接受项目" style="margin-top: 4px;"></input></a>
							<a href="uploadCase.jsp"><input class="button button_shadow"
								type="button" value="上传案例"></input></a>
						</s:if>
						<s:else>
							<s:if test="%{#session.employer!=null}">
								<a href="#"><input class="button button_border"
									type="button" value="发布需求"></input></a>
								<a href="findall.action"><input class="button button_border"
									type="button" value="浏览案例"></input></a>
							</s:if>
							<s:else>
								<a href="#"><input class="button button_border"
									type="button" value="发布需求" style="margin-top: 4px;"></input></a>
								<a href="#"><input class="button button_shadow"
									type="button" value="成为设计师"></input></a>
							</s:else>
						</s:else>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- //banner -->
	<!-- agile-about -->
	<div class="jarallax agile-about w3ls-section">
		<div class="container">
			<h2 class="w3ls_head">
				<span>About </span>Us
			</h2>
			<p class="w3agile">While designing your living room, it’s a good
				idea to think about certain key aspects like space available, the
				colours to be used, the kind of furniture and accessories you fancy.
			</p>
			<div class="agile-about-grids">

				<div class="col-md-6 col-sm-6 agile-about-grid agile-about-grid1 ">
					<h5>
						About Furnishings
						</h3>
						<h4>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</h4>
						<p>sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, sunt in culpa qui officia
							deserunt mollit anim id est laborum. Duis aute irure dolor in
							reprehenderit in voluptate velit esse cillum dolore eu fugiat
							nulla pariatur.</p>
				</div>

				<div class="col-md-6 col-sm-6 agile-about-grid agile-about-grid2 ">
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="about-info-grids">
				<div class="col-md-4 col-sm-4 about-info about-info1">
					<i class="fa fa-info-circle agile-sicon" aria-hidden="true"></i>
					<h4>how we work</h4>
					<div class="h4-underline"></div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore.</p>
				</div>
				<div class="col-md-4 col-sm-4 about-info about-info2">
					<i class="fa fa-question-circle agile-sicon" aria-hidden="true"></i>
					<h4>what we do</h4>
					<div class="h4-underline"></div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore.</p>
				</div>
				<div class="col-md-4 col-sm-4 about-info about-info3">
					<i class="fa fa-registered agile-sicon" aria-hidden="true"></i>
					<h4>why choose us</h4>
					<div class="h4-underline"></div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore.</p>
				</div>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
	<div class="special jarallax">
		<div class="container">
			<h3 class="w3ls_head">
				<span class="thr"></span>优秀作品
			</h3>
			<p class="w3agile fru">While designing your living room, it’s a
				good idea to think about certain key aspects like space available,
				the colours to be used, the kind of furniture and accessories you
				fancy.</p>
			<div class="special-grids">
	<!-- //agile-about -->
	<!-- special -->
		<%
	
    ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    IAdminService service=(IAdminService)ctx.getBean("adminService");
    Example example;
    List list=service.displayExp();
    ExamplePicture ep;
    String picture;
    IExamplePictureDAO dao=(IExamplePictureDAO)ctx.getBean("examplePictureDAO");
	if(list!=null)
	{
		int k=0;
	   for(int j=0;j<list.size() && j<4;j++){
	      example=(Example)list.get(j);
	      request.setAttribute("example",example);
	      picture=dao.findById1(example.getExampleId());
	      
	      
    %>
	
				<div class="col-md-6 w3l-special-grid">
					<div class="col-md-6 w3ls-special-img"><img src="<%=picture%>" heigth="300" width="300"  border="0"/></div>
					<div class="col-md-6 agileits-special-info">
						<h4>${example.name}</h4>
						<p>${example.description}</p>
					</div>
					<div class="clearfix"></div>
				</div>
				
	<%
	   }}
	%>
	<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<!-- //special -->
	<!-- testimonials -->
	<div class="testimonials jarallax">
		<div class="container">
			<h3 class="w3ls_head">
				<span>Our </span>Client Say
			</h3>
			<p class="w3agile">While designing your living room, it’s a good
				idea to think about certain key aspects like space available, the
				colours to be used, the kind of furniture and accessories you fancy.
			</p>

			<div class="w3ls_testimonials_grids">
				<section class="center slider">
				<div class="agileits_testimonial_grid">
					<div class="w3l_testimonial_grid">
						<p>In eu auctor felis, id eleifend dolor. Integer bibendum
							dictum erat, non laoreet dolor.</p>
						<h4>Rosy Crisp</h4>
						<h5>Lorem</h5>
						<div class="w3l_testimonial_grid_pos">
							<img src="images/1.png" alt=" " class="img-responsive" />
						</div>
					</div>
				</div>
				<div class="agileits_testimonial_grid">
					<div class="w3l_testimonial_grid">
						<p>In eu auctor felis, id eleifend dolor. Integer bibendum
							dictum erat, non laoreet dolor.</p>
						<h4>Laura Paul</h4>
						<h5>Lorem</h5>
						<div class="w3l_testimonial_grid_pos">
							<img src="images/2.png" alt=" " class="img-responsive" />
						</div>
					</div>
				</div>
				<div class="agileits_testimonial_grid">
					<div class="w3l_testimonial_grid">
						<p>In eu auctor felis, id eleifend dolor. Integer bibendum
							dictum erat, non laoreet dolor.</p>
						<h4>Michael Doe</h4>
						<h5>Lorem</h5>
						<div class="w3l_testimonial_grid_pos">
							<img src="images/1.png" alt=" " class="img-responsive" />
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>
	</div>
	
	<!-- //testimonials -->
	<!-- stats -->
	<div class="stats jarallax">
		<div class="container">
			<h3 class="w3ls_head">
				<span class="thr">Our </span>Stats
			</h3>
			<p class="w3agile fru">While designing your living room, it’s a
				good idea to think about certain key aspects like space available,
				the colours to be used, the kind of furniture and accessories you
				fancy.</p>
			<div class="stat_top">
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid">
					<span class="fa fa-folder-open" aria-hidden="true"></span>
					<h3>Projects</h3>
					<p class="counter">1045</p>

				</div>
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid1">
					<span class="fa fa-user" aria-hidden="true"></span>
					<h3>Staff</h3>
					<p class="counter">165</p>

				</div>
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid2">
					<span class="fa fa-users" aria-hidden="true"></span>
					<h3>Customers</h3>
					<p class="counter">563</p>

				</div>
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid3">
					<span class="fa fa-trophy" aria-hidden="true"></span>
					<h3>Awards</h3>
					<p class="counter">245</p>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //stats -->
	<!-- team -->
	<div class="team">
		<div class="container">
			<h3 class="w3ls_head">
				<span>优秀</span>设计师
			</h3>
			<p class="w3agile">While designing your living room, it’s a good
				idea to think about certain key aspects like space available, the
				colours to be used, the kind of furniture and accessories you fancy.
			</p>
			 <div class="agileits_team_grids">
			
	<%
	
    Designer designer;
    List list1=service.displayDes();
	if(list1!=null)
	{
		int k=0;
	   for(int j=0;j<list1.size() && j<3;j++){
	      designer=(Designer)list1.get(j);
	      request.setAttribute("designer",designer);
	      
    %>
             
				<div class="col-md-4 agileits_team_grid">
					<div class="agileits_team_grid_figure">
					<img src="<%=designer.getProfilePhoto()%>" class="img-responsive" />
					</div>
					<h4>${designer.name}</h4>
					<p>${designer.region}</p>
					<p>${designer.phone}</p>
					
				</div>
	<%
	   }
	}
	%>
	<div class="clearfix"></div>
				</div>
		</div>
	</div>
	<!-- //team -->

	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_agile_footer_grids">
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Latest Tweets</h3>
					<ul class="agile_footer_grid_list">
						<li><i class="fa fa-twitter" aria-hidden="true"></i>Nam
							libero tempore, cum soluta nobis est eligendi optio cumque nihil
							impedit. <span>1 day ago</span></li>
						<li><i class="fa fa-twitter" aria-hidden="true"></i>Itaque
							earum rerum hic tenetur a sapiente delectus <a
							href="mailto:info@mail.com">info@mail.com</a> cumque nihil
							impedit. <span>2 days ago</span></li>
					</ul>
				</div>
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Navigation</h3>
					<ul class="agileits_w3layouts_footer_grid_list">
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="index.html">Home</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="services.html">Services</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="projects.html">Projects</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="contact.html">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Latest Works</h3>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s6.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s2.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s1.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s3.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s4.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s5.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="w3_newsletter_footer_grids">
				<div class="w3_newsletter_footer_grid_left">
					<form action="#" method="post">
						<input type="email" name="Email" placeholder="Email" required="">
						<input type="submit" value="Send">
					</form>
				</div>


			</div>

			<div class="agileinfo_copyright">
				<p>
					© 2018 Upholstery. All Rights Reserved | Design by <a
						href="https://w3layouts.com/">W3layouts</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- carousal -->
	<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			$(".center").slick({
				dots : true,
				infinite : true,
				centerMode : true,
				slidesToShow : 2,
				slidesToScroll : 2,
				responsive : [ {
					breakpoint : 768,
					settings : {
						arrows : true,
						centerMode : false,
						slidesToShow : 2
					}
				}, {
					breakpoint : 480,
					settings : {
						arrows : true,
						centerMode : false,
						centerPadding : '40px',
						slidesToShow : 1
					}
				} ]
			});
		});
	</script>
	<!-- //carousal -->
	<script src="js/jarallax.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed : 0.5,
			imgWidth : 1366,
			imgHeight : 768
		})
	</script>
	<!-- stats -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->

</body>
</html>