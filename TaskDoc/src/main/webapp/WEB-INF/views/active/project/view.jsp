<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode=request.getParameter("pcode");
%>
<style>

/* Pie Chart */
.progress-pie-chart {
	width: 100px; /*반절*/
	height: 100px; /*반절*/
	border-radius: 50%;
	background-color: #E5E5E5;
	position: relative;
	margin-top: 30px;
	float: left;
}

.progress-pie-chart.gt-50 {
	background-color: #81CE97;
}

.ppc-progress {
	content: "";
	position: absolute;
	border-radius: 50%;
	left: calc(50% - 50px); /*px반절*/
	top: calc(50% - 50px); /*px반절*/
	width: 100px; /*반절*/
	height: 100px; /*반절*/
	clip: rect(0, 100px, 100px, 50px); /*px반절*/
}

.ppc-progress .ppc-progress-fill {
	content: "";
	position: absolute;
	border-radius: 50%;
	left: calc(50% - 50px); /*반절*/
	top: calc(50% - 50px); /*반절*/
	width: 100px; /*반절*/
	height: 100px; /*반절*/
	clip: rect(0, 50px, 100px, 0); /*반절*/
	background: #81CE97;
	transform: rotate(60deg);
}

.gt-50 .ppc-progress {
	clip: rect(0, 50px, 100px, 0);
}

.gt-50 .ppc-progress .ppc-progress-fill {
	clip: rect(0, 100px, 100px, 50px);
	background: #E5E5E5;
}

.ppc-percents {
	content: "";
	position: absolute;
	border-radius: 50%;
	left: calc(50% - 70px/ 2); /*반절*/
	top: calc(50% - 70px/ 2); /*반절*/
	width: 70px; /*반절*/
	height: 70px; /*반절*/
	background: #fff;
	text-align: center;
	display: table;
}

.ppc-percents span {
	display: block;
	font-size: 1em; /*글자 크기*/
	font-weight: bold;
	color: #81CE97;
}

.pcc-percents-wrapper {
	display: table-cell;
	vertical-align: middle;
}
</style>
<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
//pro_header.jsp , pro_header.js 에서 <script>태그 안에서 변수 사용가능하다.	
var pcode=<%=pcode%>
	;
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

					<!-- TAB CONTENTS  -->
					<div class="tab-content" style="width: 100%; height: 93%;">

						<!--chat include -->
						<div id="chats" class="tab-pane fade in active"
							style="width: 100%; height: 100%;">
							<div
								style="background-color: black; width: 500px; height: 500px;">
							</div>
							<div
								style="background-color: black; width: 500px; height: 500px;">
							</div>
							<div
								style="background-color: black; width: 500px; height: 500px;">
							</div>
						</div>

						<!--public task include div -->
						<div id="ptasks" class="tab-pane fade"
							style="width: 100%; height: 100%; display: -webkit-box;">

							<!--공용업무 DIV WRAPPER  -->
							<div id="publictaskdiv"
								style="width: 25%; height: 100%; background-color: black; overflow: auto;">

								<!--공용업무 NAME, 생성 BUTTON 상위 DIV -->
								<div id="publictaskTOP" style="width: 100%; height: 10%;">
									<span>공용 업무</span>
									<button type="button">생성</button>
								</div>

								<!--공용업무 리스트가 들어갈 하위 DIV  -->
								<div id="publictaskBOTTOM" style="width: 100%; height: 90%;">

								</div>

							</div>

							<!--세부 업무  -->
							<div style="width: 25%; height: 100%; background-color: yellow;">
								세부업무
								<button type="button" id="sebu1" style="display: none;">세부업무1</button>
								<button type="button" id="sebu2" style="display: none;">세부업무2</button>
							</div>

							<!--개인 업무  -->
							<div style="width: 25%; height: 100%; background-color: green;">
								개인업무
								<button type="button" id="gein1" style="display: none;">개인업무1</button>
							</div>

							<!--완료된 업무  -->
							<div style="width: 25%; height: 100%; background-color: gray;">완료된업무
							</div>
						</div>

						<!--gantt  include-->
						<div id="gantts" class="tab-pane fade">gantt</div>

						<!--files include -->
						<div id="files" class="tab-pane fade">files</div>

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
		for (var i = 1; i < 3; i++) {
		var $append = '<div id="publictask'+i+'"style="width: 100%; height: 200px; background-color: white;"> <div style="width: 100%; height: 20%;">제목</div> '
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