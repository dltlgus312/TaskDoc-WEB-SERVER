<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>

<%@include file="/WEB-INF/views/fix/header.jsp"%>

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String paramId = request.getParameter("id");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
</script>
<style>
.box2 {
	display: inline-block;
	height: 100px;
	margin: 1em;
}
</style>
</head>
<body>
	<!--FRAME fwefdsd -->
	<div id="frame">
		<!--MAIN HEADER  -->
		<%@include file="/WEB-INF/views/fix/main_header.jsp"%>
		<!--MAIN HEADER  -->

		<!--WRAPPER  -->
		<div id="wrapper">

			<!--SIDE BAR  -->
			<%@include file="/WEB-INF/views/fix/left_side.jsp"%>
			<!--SIDE BAR  -->

			<!--CONTENTWRAP  -->
			<div id="contentwrap" style="background-color: #e0e0e0;">
				<!--PROJECT 가입 O  -->
				<div class="containers"
					style="margin-top: 20px;">
					<div class="box2"
						style="background-color: white; box-shadow: 4px 4px 7px grey">

						<div class="projectheader" style="width: 100%;">

							<div id="headername"
								style="width: 80%; height: 100%; float: left; background-color: #ed8151;">
								<span id="headernames" style="color: black">안녕하세요안녕하세요안녕하세요안녕하세요</span>
							</div>

							<div id="headerimg"
								style="width: 20%; height: 100%; float: right; background-color: white;">
								<button type="button"
									style="width: 100%; height: 50%; outline: none; border: 0; background-color: white;">
									<img alt=""
										src="${pageContext.request.contextPath }/resources/img/img_boardsetting.png"
										style="width: 18px; height: 18px;">

								</button>
								<button type="button"
									style="width: 100%; height: 50%; outline: none; border: 0; background-color: white;">
									<img alt=""
										src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"
										style="width: 18px; height: 18px;">

								</button>
							</div>

						</div>

						<div class="projectbottom"
							style="width: 100%; height:; display: table; overflow: auto;">

							<div id="10" style="width: 100%; height: 60%; overflow: auto;">
								<span id="fd" style="color: black">여기는 프로젝트의 부제목이 적힐
									곳입니다.</span>
							</div>
							<div id="20"
								style="width: 100%; height: calc(40%/ 3);">
								<span id="fd" style="color: black; ">2018-08-30</span>
							</div>
							<div id="30" style="width: 100%; height: calc(40%/ 3);">
								<span id="fd" style="color: black; ">2018-08-42</span>
							</div>
							<div id="40" style="width: 100%; height: calc(40%/ 3)">
								<span id="fd" style="color: black;  margin-right:3px;float:right;">OWNER</span>
							</div>
						</div>
					</div>
					<div class="box2" style="background-color: black"></div>
					<div class="box2" style="background-color: black"></div>
					<div class="box2" style="background-color: black"></div>
					<div class="box2" style="background-color: black"></div>
					<div class="box2" style="background-color: black"></div>
				</div>
				<!--PROJECT 초대 O  -->
				<div class="containers"
					style="margin-top: 50px;">
					<div class="box2" style="background-color: black"></div>
				</div>
			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->

	</div>
	<!--FRAME  -->
</body>


<script>
	$(document).ready(function() {
		var contentWidth = $("#contentwrap").width();
		var contentHeight = $("#contentwrap").height();
		//$(".container").css('width',contentWidth + "px")
		$(".containers").css('width', $('#contentwrap').width() / 1.3).css('margin-left', $('#contentwrap').width() / 6 + "px");
		$(".box2").css('width', $('.containers').width() / 5 + "px").css('height', $('#contentwrap').height() / 4 + "px");
		$(".projectheader").css('height',$('.box2').height() * 0.25);
		$(".projectbottom").css('height',$('.box2').height() * 0.75);

		/*
		$("#1").css('width', $('.main').width() / 5);
		$("#1").css('height', $('.main').height() / 5);

		$("#2").css('width', $('.main').width() / 5);
		$("#3").css('height', $('.main').height() / 5);

		$("#3").css('width', $('.main').width() / 5);
		$("#3").css('height', $('.main').height() / 5);

		$("#4").css('width', $('.main').width() / 5);
		$("#4").css('height', $('.main').height() / 5);

		$("#5").css('width', $('.main').width() / 5);
		$("#5").css('height', $('.main').height() / 5); */

	});
</script>
</html>