<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/project/circleChart.css" />
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode=request.getParameter("pcode");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
//pro_header.jsp , pro_header.js 에서 <script>태그 안에서 변수 사용가능하다.	
var pcode=<%=pcode%>;
</script>

</head>
<body>
	<!--FRAME  -->
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
				<div class="container"
					style="background-color: white; overflow: auto;">

					<!-- PROJECT_FIX_HEADER  -->
					<%@include file="/WEB-INF/views/active/project/fix/pro_header.jsp"%>

					<!-- TASK CONTENTS  -->
					<div style="width: 100%; height: 93%;overflow:auto;">
						<div class="bts" style="margin-bottom:30px;">
							<button class="btn" type="button" style="background-color:#ed8151; color:white;">공용업무 생성하기</button>
						</div>	
						<div id="publictaskBOTTOM" style="display: -webkit-inline-box;">
						
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->

	</div>
	<!--FRAME  -->
</body>
<script type="text/javascript">
$(document).ready(function() {
	for (var i = 1; i < 6; i++) {
	var $append = '<div id="publictask'+i+'"style="width: 500px; height: 200px; background-color: white;"> <div style="width: 100%; height: 20%;">제목</div> '
	+' 	<div style="width: 100%; height: 80%;"><div id="chart'+i+'" class="progress-pie-chart" data-percent="51" onclick="test('+i+')"><div class="ppc-progress">'
	+'<div class="ppc-progress-fill" id="fill'+i+'"></div></div><div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+i+'">%</span></div></div></div>'
	+'<div><span>제목</span> <span>시작날짜</span> <span>끝나는날짜</span></div></div></div>';
	
	$("#publictaskBOTTOM").append($append);
	
	var a = $("#chart"+i.toString());
	var percent = parseInt(a.data('percent'));
	var deg = 360 * percent / 100;
	if (percent > 50) {
		a.addClass("gt-50");
	}
	var b=$("#fill"+i.toString());
	b.css('transform', 'rotate(' + deg + 'deg)');
	$('#num'+i.toString()).html(percent + '%');
	}
});

 function test(i) {
	var b = $("#chart"+i.toString());
	var test = prompt("z", "z");
	if (test > 100) {
		alert('100이상은 입력할수없습니다.');
	} else {
		percent = parseInt(test);
		deg = 360 * percent / 100;
		if (percent > 50) {
			b.addClass("gt-50");
		}
		else{
			b.removeClass("gt-50");
		}
		$('#fill'+i.toString()).css('transform', 'rotate(' + deg + 'deg)');
		$('#num'+i.toString()).html(percent + '%');
	} 
} 
</script>

</html>