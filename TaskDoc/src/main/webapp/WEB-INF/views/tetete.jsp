<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--HTML5임을 명시  -->
<!DOCTYPE html>
<html>
<head>
<!--HTML charset 명시  -->
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- header.jsp css,js include할것   -->
<%@include file="/WEB-INF/views/fix/header.jsp"%>
</head>

<body>
	<div id="frame" style="width: 100%; margin: 0px;">
		
		<div id="main_header">
			<!-- main_header.jsp 탑 메뉴 고정   -->
			<%@include file="/WEB-INF/views/fix/main_header.jsp"%>
		</div>

		<div id="wrapper" style="width: 100%;">
			<!-- sidebar.jsp 사이드바 메뉴 고정   -->
			<%@include file="/WEB-INF/views/fix/left_side.jsp"%>
			<!-- content.jsp content넣을것   -->
			<div id="content-wrapper"
				style="width: 80%; height: 500px; background-color: yellow"></div>
		</div>
		
		<!-- footer.jsp 하단 고정   -->
		<footer id="footer" style="height: 50px; background-color: black;">
			<%-- <%@include file=""%> --%>
		</footer>
	</div>
</body>
</html>