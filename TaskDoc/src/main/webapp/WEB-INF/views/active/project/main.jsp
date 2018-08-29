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
					<div class="projectlists">

						<div class="projectheader" style="width: 100%;">

							<div class="headername">
								<span id="pro_titlename" style="color: black"></span>
							</div>

							<div class="headerimg">
								<button type="button" class="prosetinviteimg">
									<img alt=""
										src="${pageContext.request.contextPath }/resources/img/img_boardsetting.png"
										style="width: 18px; height: 18px;">

								</button>
								<button type="button" class="prosetinviteimg">
									<img alt=""
										src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"
										style="width: 18px; height: 18px;">

								</button>
							</div>

						</div>

						<div class="projectbottom"
							style="width: 100%; height:; display: table; overflow: auto;">

							<div id="pro_subdiv" style="width: 100%; height: 60%; overflow: auto;">
								<span id="pro_subtitlename" style="color: black"></span>
							</div>
							<div id="pro_sdatediv"
								style="width: 100%; height: calc(40%/ 3);">
								<span id="pro_sdate" style="color: black; "></span>
							</div>
							<div id="pro_edatediv" style="width: 100%; height: calc(40%/ 3);">
								<span id="pro_edate" style="color: black; "></span>
							</div>
							<div id="pro_posidiv" style="width: 100%; height: calc(40%/ 3)">
								<span id="pro_position" style="color: black;  margin-right:3px;float:right;"></span>
							</div>
						</div>
					</div>
					
				</div>
				<!--PROJECT 초대 O  -->
				<div class="containers"
					style="margin-top: 50px;">
					<div class="projectlists" style="background-color: black"></div>
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
		$(".projectlists").css('width', $('.containers').width() / 5 + "px").css('height', $('#contentwrap').height() / 4 + "px");
		$(".projectheader").css('height',$('.projectlists').height() * 0.25);
		$(".projectbottom").css('height',$('.projectlists').height() * 0.75);

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