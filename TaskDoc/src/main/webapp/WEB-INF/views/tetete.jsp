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
	<!--FRAME fwef -->
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
				<div class="containers" style="text-align: center;margin-top: 20px;">
						<div class="box2" style="background-color: white">
							
							<div class="projectheader" style="width:100%;height:25%; background-color:orange;">
								
								<div id="headername"style="width:80%; height:100%; background-color:black;float:left;">
									<span id="headernames" style="color:white">여기는 프로젝트이름이야여기는 프로젝트이름이야</span>
								</div>
								
								<div id="headerimg" style="width:20%; height:100%;background-color:white; float:right;">
									<button type="button" style="height:50%;">버튼1</button>
									<button type="button" style="height:50%;">버튼2</button>
								</div>
								
							</div>
							
							<div class="projectbottom"style="width:100%;height:75%; background-color:red;">
							
							</div>
						</div>
						
						<div class="box2" style="background-color: white">
						
						</div>
						<div class="box2" style="background-color: white"></div>
						<div class="box2" style="background-color: white"></div>
						<div class="box2" style="background-color: white"></div>
						<div class="box2" style="background-color: white"></div>
						<div class="box2" style="background-color: white"></div>
						<div class="box2" style="background-color: white"></div>
						<div class="box2" style="background-color: white"></div>
				</div>
				<!--PROJECT 초대 O  -->
				<div class="containers" style="text-align: center;">
						<div class="box2" style="background-color: black"></div>
						<div class="box2" style="background-color: black"></div>
						<div class="box2" style="background-color: black"></div>
						<div class="box2" style="background-color: black"></div>
						<div class="box2" style="background-color: black"></div>
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
		$(".containers").css('width', $('#contentwrap').width() / 1.3);
		$(".containers").css('margin-left', $('#contentwrap').width() / 9);
		$(".box2").css('width', $('.containers').width() / 4 + "px");
		$(".box2").css('height', $('#contentwrap').height() / 3 + "px");
		
		if(contentWidth>1500){
			
		}

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