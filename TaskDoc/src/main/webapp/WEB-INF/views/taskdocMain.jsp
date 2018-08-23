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
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/normalize.css?ver=422" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/demo.css?ver=422" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/component.css?ver=2223" />
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
					<a class="codrops-icon codrops-icon-prev"><span>TaskDoc</span></a>
					<button id="showMenu" style="font-size: 11px;">Show Menu</button>

					<!-- LOGIN BUTTON -->
					<span class="right">
						<button id="LoginButton" class="codrops-icon codrops-icon-drop">
							<span style="font-size: 11px;">LOGIN</span>
						</button> <!-- /LOGIN BUTTON --> <!-- JOIN BUTTON -->
					</span>
					 <span class="right">
						<button id="JoinButton" class="codrops-icon codrops-icon-drop">
							<span style="font-size: 11px;">JOIN</span>
						</button> <!-- /JOIN BUTTON -->
					</span>
					
					<!-- TEST -->
					 <span class="right">
						<button id="proButton" class="codrops-icon codrops-icon-drop">
							<span style="font-size: 11px;">PROJECT</span>
						</button> <!-- /JOIN BUTTON -->
					</span>
					 <span class="right">
						<button id="chatButton" class="codrops-icon codrops-icon-drop">
							<span style="font-size: 11px;">CHAT</span>
						</button> <!-- /JOIN BUTTON -->
					</span>
					<!-- /TEST -->
				</div>
				
				<header class="codrops-header">
					<h1 style="font-family: Title_Medium">
						TaskDoc <span>Task(작업) + Document(기록)</span>
					</h1>
				</header>


				<div class="main clearfix">
					<div class="column">
						<p style="font-family:Title_Light; font-size:20px;">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
						<p style="font-family:Title_Light; font-size:20px;">- 일정과 톡을 연동한 프로젝트(일정, 회의, 파일) 관리 시스템</p>
					</div>
					<div class="column">
						<nav class="codrops-demos">
							<a href="" class="current-demo">TEST</a> <a href="">TEST</a> <a
								href="">TEST</a> <a href="">TEST</a> <a href="">TEST</a> <a
								href="">TEST</a>
						</nav>
					</div>
					<div class="related">
						<p>If you enjoyed this demo you might also like:</p>
						<p>
							<a href="">Animated Border Menus</a>
						</p>
						<p>
							<a href="">Transitions for Off-Canvas Navigations</a>
						</p>
					</div>
				</div>
				<!-- /main -->
			</div>
			<!-- wrapper -->
		</div>
		<!-- /container -->
		<nav class="outer-nav left vertical">
			<a href="/" class="icon-home">Home</a> <a
				href="/" class="icon-news">Board</a> <a
				href="/" class="icon-image">Images</a> <a href=""
				class="icon-upload">Uploads</a> <a href="/" class="icon-star">Favorites</a>
			<a href="/" class="icon-mail">Messages</a> <a href="#"
				class="icon-lock">Edit Account</a>
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
	var testHost = 'http://localhost:8080';
	var serverHost = '';

	$(function() {
		$("#JoinButton").click(function() {
			location.href = testHost + '/user/join';
		});
		$("#LoginButton").click(function() {
			location.href = testHost + '/user/login';
		});
	});
	
	/* TEST  */
	$(function() {
		$("#proButton").click(function() {
			location.href = testHost + '/project/main';
		});
		$("#chatButton").click(function() {
			location.href = testHost + '/chat/main';
		});
	});
	
	
	
	/* /TEST */

	</script>
</html>