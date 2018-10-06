
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
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
$(document).ready(function(){
	var contentheight = $("#contentwrap").height();
	var contentwidth = $("#contentwrap").width();
	$(".container").css('height', contentheight);
	$(".container").css('width', contentwidth / 1.1);
});
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

					<!-- TASK CONTENTS  -->
					<div id="publictaskWRAP" style="width: 100%; /* height: 93%; */ padding-left:15px;">
						<div id="publictaskTOP" class="bts" style="margin-bottom:30px;">
						</div>	
						
						<div id="publictaskBOTTOM">
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
var screenW = screen.availWidth;  // 스크린 가로사이즈
var screenH = screen.availHeight; // 스크린 세로사이즈
var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션

$.ajax({
	type : 'GET',
	url : '/privatetask/user/' + id,
	success : function(response) {
		if (response.length > 0 ) {
			for(var i=0;i<response.length;i++){
				if(response[i].ptcode==response[i].ptrefference){
					var $append = '<div id="publictask'+response[i].ptcode+'" style="float: left; width: 24%; margin-right:1%; margin-bottom:10px; height: 200px; background-color: white;">'
					+'<div onclick="godowntask('+response[i].ptcode+')" style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response[i].ptcolor+';"><span>'+ (i+1) +'. : '+response[i].pttitle+','+response[i].ptcode+'</span></div>'
					+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
					+'<div style="margin-left:20px;" id="chart'+response[i].ptcode+'" class="progress-pie-chart" data-percent="'+response[i].ptpercent+'">'
					+'<div class="ppc-progress">'
					+'<div class="ppc-progress-fill" id="fill'+response[i].ptcode+'"></div></div>'
					+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response[i].ptcode +'">%</span></div></div></div>'
					+'<div><div><span>시작 날짜 : '+response[i].ptsdate+'</span></div><div><span>종료 날짜 : '+response[i].ptedate+'</span></div>'
					+'<div class="bts"><button style="border:0px;outline:none;color:white;background-color:#ed8151;margin-right:5px;font-size:12px;" class="btn" onclick= "goMemo('+response[i].ptcode+')" type="button">메모</button>'
					+'<button style="border:0px;outline:none;color:white;background-color:#ed8151;margin-right:5px;font-size:12px;" class="btn" onclick= "ptedit('+response[i].ptcode+')" type="button">수정</button>'
					+'<button style="border:0px;outline:none;color:white;background-color:#ed8151;font-size:12px;" class="btn" type="button" onclick="ptdel('+response[i].ptcode+')">삭제</button></div></div></div></div>';
					
					$("#publictaskBOTTOM").append($append);
				}
				var a = $("#chart"+response[i].ptcode.toString());
				var percent = parseInt(a.data('percent'));
				var deg = 360 * percent / 100;
					if (percent > 50) {
						a.addClass("gt-50");
					}
				var b=$("#fill"+response[i].ptcode.toString());
				b.css('transform', 'rotate(' + deg + 'deg)');
				$('#num'+response[i].ptcode.toString()).html(percent + '%');	
				
				}
			} else{
			alert('Server or Client ERROR, 개인 업무 조회 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});

//개인 업무 삭제
function ptdel(ptcode){
	 event.stopPropagation();
	 if(confirm('개인 업무를 삭제하시겠습니까?')==true){
		$.ajax({
			type : 'DELETE',
			url : '/privatetask/' + ptcode,
			success : function(response) {
				if (response == 1) {
					alert('개인 업무 삭제 성공!');
					location.reload();
				} else if (response == -1) {
					alert('Server or Client ERROR, 개인 업무 삭제 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	 }
	 else return;
}

//개인 업무 수정
function ptedit(ptcode){
	 event.stopPropagation();
	 var popW = 400; // 띄울창의 가로사이즈
	 var popH = 560; // 띄울창의 세로사이즈
	 if(confirm('개인 업무를 수정하시겠습니까?')==true){
			window.open("/project/privateTask/edit?ptcode="+ptcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
	 }
	 else return;
}

//메모 생성
function goMemo(ptcode){
	 event.stopPropagation();
	 var popW = 500; // 띄울창의 가로사이즈
	 var popH = 450; // 띄울창의 세로사이즈
	 if(confirm('메모를 확인하시겠습니까??')==true){
			window.open("/project/memo/main?ptcode="+ptcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
	 }
	 else return;
}

//하위업무로이동
function godowntask(ptcode){
	 if(confirm('하위 업무로 이동하시겠습니까?')==true){
		 $("#ptcreatebtn").hide();
		 $("#publictaskBOTTOM").load("/project/privateTask/downTask?ptcode="+ptcode); 
		 
		 $btntag='<button class="btn" type="button" onclick="gotasklist('+ptcode+')" style="background-color:#ed8151; border:0;outline:none; color:white;">개인업무 리스트로 이동</button>';
		 $("#publictaskTOP").append($btntag);
	 }else return;
}

//모든 개인업무 리스트로 이동
function gotasklist(ptcode){
	 location.href='/project/privateTask/main';
}
</script>

</html>