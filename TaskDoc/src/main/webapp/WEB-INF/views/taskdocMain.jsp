<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!-- 전체적인 Bootstrap resource -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Perspective Page View Navigation: wefwefwe" />
<meta name="keywords"
	content="3d page, menu, navigation, mobile, perspective, css transform, web development, web design" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/normalize.css?ver=4262" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/demo.css?ver=4262" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/component.css?ver=22263" />
<script
	src="${pageContext.request.contextPath }/resources/js/taskdocMain/modernizr.custom.25376.js"></script>

<!-- /전체적인 Bootstrap resource -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>


</head>
<body>
	<div id="perspective" class="perspective effect-airbnb">
		<div class="container">
			<div class="wrapper">
				<div class="codrops-top clearfix">
					<a><span style="font-size:14px;font-family:Title_Light;">TaskDoc</span></a>
					<button id="showMenu" style="font-family:Title_Light;font-size: 14px;">Show Menu</button>

					<!-- LOGIN BUTTON -->
					<span class="right">
						<button id="LoginButton">
							<span style="font-size: 14px;font-family:Title_Light;">LOGIN</span>
						</button> <!-- /LOGIN BUTTON --> <!-- JOIN BUTTON -->
					</span>
					 <span class="right">
						<button id="JoinButton">
							<span style="font-size: 14px;font-family:Title_Light;">JOIN</span>
						</button> <!-- /JOIN BUTTON -->
					</span>
					
					<!--  <span class="right">
						<button id="proButton">
							<span style="font-size: 14px;">PROJECT</span>
						</button> /JOIN BUTTON
					</span>
					 <span class="right">
						<button id="chatButton">
							<span style="font-size: 14px;">CHAT</span>
						</button> /JOIN BUTTON
					</span> -->
				</div>
				
				<header class="codrops-header" style="margin-bottom:-48px;">
					<span style="font-family: Title_Medium;font-size:55px;color:#ed8151;">
						TaskDoc <span style="font-size:30px;">Task(작업) + Document(기록)</span>
					</span>
				</header>


				<div class="main clearfix" style="margin-top:50px;">
					<div class="column" style="display:grid;text-align:center;">
						<p style="font-family:Title_Light; font-size:20px;color:#aca89a">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;color:#aca89a">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;color:#aca89a">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;color:#aca89a">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;color:#aca89a">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
					</div>
					<div class="column">
						<nav class="codrops-demos">
						<!--여기사진넣기  -->
						</nav>
					</div>
					<div class="related">
						<p style="font-family:Title_Light;">Copyright 2018. TaskDoc all rights reserved.</p>
						<p>
							<a href="" style="font-family:Title_Light;">WELCOME TO</a>
						</p>
						<p>
							<a href=""style="font-family:Title_Light;">TaskDoc</a>
						</p>
					</div>
				</div>
				<!-- /main -->
			</div>
			<!-- wrapper -->
		</div>
		<!-- /container -->
		<nav class="outer-nav left vertical">
			<a href="/" >Home</a> <a
				href="/" >Board</a> <a
				href="/" >Images</a> <a href="">Uploads</a> <a href="/"></a>
			<a href="/" >Messages</a> <a href="#"
				>Edit Account</a>
		</nav>
	</div>
	<!-- /perspective -->

	<!-- Main에서 SHOW MENU클릭시 나타나는 이벤트 js -->
	<script
		src="${pageContext.request.contextPath }/resources/js/taskdocMain/classie.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/taskdocMain/menu.js"></script>
	<!-- Main에서 SHOW MENU클릭시 나타나는 이벤트 js -->

<script type="text/javascript">

	$(function() {
		$("#JoinButton").click(function() {
			location.href = '/user/join';
		});
		$("#LoginButton").click(function() {
			location.href = '/user/login';
		});
	});
	
	/* TEST  */
	$(function() {
		$("#proButton").click(function() {
			location.href ='/project/main';
		});
		$("#chatButton").click(function() {
			location.href = '/chat/main';
		});
	});
	
	
	
	/* /TEST */

	</script>
</html>