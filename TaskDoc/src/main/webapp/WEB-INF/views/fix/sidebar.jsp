<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- sidebar js -->
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script
	src="${pageContext.request.contextPath }/resources/js/sidebar/jquery-ui-1.11.4.custom.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/sidebar/sidebar.js?ver=162"></script>
<!-- sidebar js -->

<!-- sidebar css  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sidebar/sidebar.css?ver=132">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sidebar/normalize.css">
<!-- sidebar css  -->

<!-- test -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sidebar/menu/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sidebar/menu/slinky.min.css">
<!-- test -->
<body>
	<!-- sidebar wrap -->
	<aside class="sidebar" style="left:-320px;"> <!-- sidebar content wrap div -->
	<div class="sidebar-content">
		<!-- 상단 그라데이션 로고 div -->
		<div
			style="background: linear-gradient(to right, #ff7f00, #aa4a00); width: 249.9px; height: 117px; margin-left: -19.85px; margin-top: -20px; margin-bottom: 20px;">
			<div style="padding-top: 60px;">
				<span
					style="font-size: 25px; font-family: Title_Medium; margin-left: 15px; text-transform: none">Task
					Doc</span>
			</div>
			<div>
				<span style="font-family: Title_Light; margin-left: 15px;">프로젝트
					통합 관리 시스템</span>
			</div>
		</div>
		<!-- /상단 그라데이션 로고 div -->
		<div id="menu">
			<ul>
				<li><a href="/ajaxTest"> <img
						src="${pageContext.request.contextPath }/resources/img/img_describe.png"
						style="width: 25px;"> <span
						style="margin-left: 15px; font-size: 16px;">프로젝트</span>
				</a></li>

				<li><a href="#"> <img
						src="${pageContext.request.contextPath }/resources/img/img_task.png"
						style="width: 25px;"> <span
						style="margin-left: 15px; font-size: 16px;">개인업무</span>
				</a></li>
				
				<li>
				<a href="/user/infoEdit?id=a"> 
				<img
						src="${pageContext.request.contextPath }/resources/img/img_user.png"
						style="width: 25px;"> 
						<span
						style="margin-left: 15px; font-size: 16px;">내정보</span>
				</a></li>
				<li><a href="/methodBoard"> <img
						src="${pageContext.request.contextPath }/resources/img/img_board.png"
						style="width: 25px;"> <span
						style="margin-left: 15px; font-size: 16px;">게시판</span>
				</a></li>
				<li><a href="#"> <img
						src="${pageContext.request.contextPath }/resources/img/img_settings.png"
						style="width: 25px;"> <span
						style="margin-left: 15px; font-size: 16px;">설정</span>
				</a></li>
				<li>
				<hr width="227px" color="darkgray" noshade style="margin-bottom:10px;"/>
				</li>
				<li><span style="margin-left: 15px; font-size: 16px;color:darkgray;text-transform: none;">SIGN OUT</span></li>
				
				<li><a href="/user/logout"> <img
						src="${pageContext.request.contextPath }/resources/img/img_logout.png"
						style="width: 25px;"> <span
						style="margin-left: 15px; font-size: 16px;">로그아웃</span>
				</a></li>
			</ul>
		</div>

	</div>
	<!-- /sidebar content wrap div --> <!-- 열고닫는 button -->
	<button>
		<span class="sidebar-btn">MENU</span>
	</button>
	<!-- /열고닫는 button --> 
	</aside>
	<!-- /sidebar wrap -->

</body>


<!-- 아래는 sidebar의 menu css임. -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script
	src="${pageContext.request.contextPath }/resources/js/sidebar/menu/slinky.min.js"></script>
<script>
	const slinky = $('#menu').slinky()
</script>


</html>