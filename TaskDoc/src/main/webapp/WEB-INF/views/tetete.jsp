<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--HTML5임을 명시  -->
<!DOCTYPE html>
<html>

<head>
<!-- header.jsp css,js include할것   -->
<%@include file="/WEB-INF/views/fix/header.jsp"%>
</head>

<body>
	<div id="frame"
		style="width: 100%; height: 100%; margin: 0px; position: absolute; top: 0; left: 0; overflow: hidden;">
		
		<header id="main_header">
			<!-- main_header.jsp 탑 메뉴 고정   -->
			<nav style="background-color: red; width: 100%; height: 50px;">TaskDoc 프로젝트 통합 관리 시스템</nav>
		</header>

		<div id="wrapper" style="width: 100%; height: calc(100% - 100px);">

			<aside id="sidebar"
				style="background-color: yellow; width: 5%; height: 100%; float: left;">
				<ul style="list-style: none; padding-left: 25px;">
					<li data-toggle="tootlip" data-placement="right" title="프로젝트" style="margin-top: 40px;"><a href="/ajaxTest"> <img
							src="${pageContext.request.contextPath }/resources/img/img_describe.png"
							style="width: 25px;">
					</a></li>

					<li data-toggle="tootlip" data-placement="right" title="개인업무" style="margin-top: 40px;"><a href="#"> <img
							src="${pageContext.request.contextPath }/resources/img/img_task.png"
							style="width: 25px;">
					</a></li>

					<li data-toggle="tootlip" data-placement="right" title="내정보" style="margin-top: 40px;"><a href="/user/infoEdit?id=a">
							<img
							src="${pageContext.request.contextPath }/resources/img/img_user.png"
							style="width: 25px;">

					</a></li>
					<li data-toggle="tootlip" data-placement="right" title="방법론게시판" style="margin-top: 40px;"><a href="/methodBoard"> <img
							src="${pageContext.request.contextPath }/resources/img/img_board.png"
							style="width: 25px;">
					</a></li>
					<li data-toggle="tootlip" data-placement="right" title="설정" style="margin-top: 40px;"><a href="#"> <img
							src="${pageContext.request.contextPath }/resources/img/img_settings.png"
							style="width: 25px;">
					</a></li>

					<li data-toggle=tootlip data-placement="right" title="로그아웃" style="margin-top: 40px;"><a href="/user/logout"> <img
							src="${pageContext.request.contextPath }/resources/img/img_logout.png"
							style="width: 25px;">
					</a></li>
				</ul>
			</aside>

			<div id="contentwrap"
				style="width: 95%; height: 100%; float: left; overflow: auto;">
			</div>

		</div>
		<footer style="width: 100%; height: 50px; background-color: black;"></footer>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tootlip"]').tooltip();
	});
</script>
</html>