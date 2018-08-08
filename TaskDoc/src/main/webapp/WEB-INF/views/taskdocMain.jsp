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
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/normalize.css?ver=42" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/demo.css?ver=42" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/component.css?ver=223" />
<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load -->
<script
	src="${pageContext.request.contextPath }/resources/js/taskdocMain/modernizr.custom.25376.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- /전체적인 Bootstrap resource -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	<!-- 
		layer login
		<div class="layer_login" id="dpopupLogin" style="display: none;" data-loginForm='{ "mail" : "txtLoginEmail2", "password" : "txtLoginPW2", "submit" : "btnLoginSubmit2" , "isPopup" : true }' >
			<h2>티몬 채용 로그인</h2>
			<div class="home_login">
				<fieldset>
					<legend>로그인</legend>
					<div class="login_item">
						<label for="loginMail" class="blind">이메일 입력</label>
						<input type="text" id="txtLoginEmail2" placeholder="이메일" />
					</div>
					<div class="login_item">
						<label for="loginPw" class="blind">비밀번호 입력</label>
						<input type="password" id="txtLoginPW2" placeholder="비밀번호" />
					</div>
				</fieldset>
			</div>
			<div class="login_link">
				<a href="/join/begin" class="join">회원가입</a>
				<a href="/personal/search/mail">이메일 찾기</a>
				<a href="/personal/search/pw">비밀번호 찾기</a>
			</div>
			<button type="button" class="btn_lylogin" id="btnLoginSubmit2">이메일로 로그인</button>
			<span class="tail"></span>
			
			<button type="button" class="btn_login" style="display: inline;" data-viewCommand='{ "name" : "btnLogin" , "options" : { "target" : "dpopupLogin" } }' ><i class="blind" >로그인</i></button>
			layer 화살표
		</div>
		//layer login
		 -->
	<!-- show menu div -->
	<div id="perspective" class="perspective effect-airbnb">
		
		<div class="container">
			<div class="wrapper">
				<div class="codrops-top clearfix">
					<a class="codrops-icon codrops-icon-prev"><span>TaskDoc</span></a>
					<button id="showMenu" style="font-size: 11px;">Show Menu</button>
					<span class="right"> <!-- LOGIN BUTTON -->
						<button id="LoginButton" class="codrops-icon codrops-icon-drop">
							<span style="font-size: 11px;">LOGIN</span>
						</button> <!-- /LOGIN BUTTON -->

					</span> <span class="right"> <!-- JOIN BUTTON -->
						<button id="JoinButton" class="codrops-icon codrops-icon-drop">
							<span style="font-size: 11px;">JOIN</span>
						</button> <!-- /JOIN BUTTON -->

					</span>
				</div>
				<header class="codrops-header">
					<h1>
						TaskDoc <span>gggggggggggggggggggggggg</span>
					</h1>
				</header>


				<div class="main clearfix">
					<div class="column">
						<p>Click on this button to see the content being pushed away
							in 3D to reveal a navigation or other items.</p>
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
							<a href="http://tympanus.net/Tutorials/AnimatedBorderMenus/">Animated
								Border Menus</a>
						</p>
						<p>
							<a href="http://tympanus.net/Development/SidebarTransitions/">Transitions
								for Off-Canvas Navigations</a>
						</p>
					</div>
				</div>
				<!-- /main -->
			</div>
			<!-- wrapper -->
		</div>
		<!-- /container -->
		<nav class="outer-nav left vertical">
			<a href="#" class="icon-home">Home</a> <a
				href="http://localhost:8080/won/" class="icon-news">News</a> <a
				href="#" class="icon-image">Images</a> <a href=""
				class="icon-upload">Uploads</a> <a href="#" class="icon-star">Favorites</a>
			<a href="#" class="icon-mail">Messages</a> <a href="#"
				class="icon-lock">Security</a>
		</nav>
	</div>
	<!-- /perspective -->

	<!-- 전체적인 Bootstrap resource -->
	<script
		src="${pageContext.request.contextPath }/resources/js/taskdocMain/classie.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/taskdocMain/menu.js"></script>
	<!-- /전체적인 Bootstrap resource -->

</body>

<script type="text/javascript">
	$(function() {
		$("#JoinButton").click(function() {
			var state = $("#test").css('display');
			if (state == 'none') {
				$("#test").show();
			}else{
				$("#test").hide();
			}
		});
		$("#LoginButton").click(function() {
			alert('login');
		});
	});
</script>
</html>