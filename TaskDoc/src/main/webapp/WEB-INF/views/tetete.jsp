<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- header.jsp css,js include할것   -->
<%@include file="/WEB-INF/views/fix/header.jsp"%>
</head>

<body style="height:100%; margin:0px;">

	<div id="main_header">
		<!-- main_header.jsp 탑 메뉴 고정   -->
		<%@include file="/WEB-INF/views/fix/main_header.jsp"%>
	</div>

	<div id="wrapper">
		
		<!-- sidebar.jsp 사이드바 메뉴 고정   -->
		 <%@include file="/WEB-INF/views/fix/sidebar.jsp"%> 

		<div id="content-wrapper">
			<!-- content.jsp content넣을것   -->
		</div>
		
		<div id="footer">
			<!-- footer.jsp 하단 고정   -->
			<%-- <%@include file=""%> --%>
		</div>
	</div>
</body>
</html>