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

$(function(){
	$(".ptask_hover").css('color','#ed8151').css('border-bottom','1px solid #ed8151');
	$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
	$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
	$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
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

					<!-- PROJECT_FIX_HEADER  -->
					<%@include file="/WEB-INF/views/active/project/fix/pro_header.jsp"%>

					<!-- TASK CONTENTS  -->
					<div id="publictaskWRAP" style="width: 100%; /* height: 93%; */ padding-left:15px;">
						<div id="publictaskTOP" class="bts" style="margin-bottom:30px;">
							<button id="ptcreatebtn"  class="btn" type="button" style="display:none; background-color:#ed8151; color:white;" onclick="ptcreate(<%=pcode%>)">공용업무 생성하기</button>
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


$(document).ready(function() {
	//특정 프로젝트의 모든 공용업무를 보여준다.
	$.ajax({
		type : 'GET',
		url : '/publictask/root/' + pcode,
		success : function(response) {
			if (response.length != 0) {
				for(var i=0;i<response.length;i++){
					if(response[i].tsdate!=null && !response[i].tedate!=null){
						if(chatpermission=="OWNER"){
							var $append = '<div id="publictask'+response[i].tcode+'" style="float: left; width: 24%; margin-right:1%; margin-bottom:10px; height: 200px; background-color: white;">'
							+'<div onclick="godowntask('+response[i].tcode+')" style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response[i].tcolor+';"><span>'+ (i+1) +'. : '+response[i].ttitle+','+response[i].tcode+'</span></div>'
							+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
							+'<div style="margin-left:20px;" id="chart'+response[i].tcode+'" class="progress-pie-chart" data-percent="'+response[i].tpercent+'">'
							+'<div class="ppc-progress">'
							+'<div class="ppc-progress-fill" id="fill'+response[i].tcode+'"></div></div>'
							+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response[i].tcode +'">%</span></div></div></div>'
							+'<div><div><span>시작 날짜 : '+response[i].tsdate+'</span></div><div><span>종료 날짜 : '+response[i].tedate+'</span></div>'
							+'<div class="bts"><button onclick="downtaskcreate(\''+response[i].tsdate+ ',' +response[i].tedate+'\','+response[i].tcode+')" style="border:0px;outline:none;color:white;background-color:#ed8151; margin-right:5px; font-size:12px;" class="btn"type="button">하위 업무 생성</button>'
							+'<button style="border:0px;outline:none;color:white;background-color:#ed8151;margin-right:5px;font-size:12px;" class="btn" onclick= "ptedit(\''+response[i].tsdate+ ',' +response[i].tedate+'\','+response[i].tcode+')" type="button">수정</button>'
							+'<button style="border:0px;outline:none;color:white;background-color:#ed8151;font-size:12px;" class="btn" type="button" onclick="ptdel('+response[i].tcode+')">삭제</button></div></div></div></div>';
							$("#ptcreatebtn").show();
						}
						else if(chatpermission=="MEMBER"){
							var $append = '<div id="publictask'+response[i].tcode+'" style="float: left; width: 24%; margin-right:1%; margin-bottom:10px; height: 200px; background-color: white;">'
							+'<div onclick="godowntask('+response[i].tcode+')" style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response[i].tcolor+';"><span>'+ (i+1) +'. : '+response[i].ttitle+','+response[i].tcode+'</span></div>'
							+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
							+'<div style="margin-left:20px;" id="chart'+response[i].tcode+'" class="progress-pie-chart" data-percent="'+response[i].tpercent+'">'
							+'<div class="ppc-progress">'
							+'<div class="ppc-progress-fill" id="fill'+response[i].tcode+'"></div></div>'
							+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response[i].tcode +'">%</span></div></div></div>'
							+'<div><div><span>시작 날짜 : '+response[i].tsdate+'</span></div><div><span>종료 날짜 : '+response[i].tedate+'</span>'
							+'<div class="bts"><button style="border:0px;outline:none;color:white;background-color:#ed8151; margin-right:5px; font-size:12px;" class="btn" onclick= "privateCreate(\''+response[i].tsdate+ ',' +response[i].tedate+'\','+response[i].tcode+')" type="button">개인업무생성</button></div><div></div></div></div></div>';
						}
						$("#publictaskBOTTOM").append($append);
						
						var a = $("#chart"+response[i].tcode.toString());
						var percent = parseInt(a.data('percent'));
						var deg = 360 * percent / 100;
							if (percent > 50) {
								a.addClass("gt-50");
							}
						var b=$("#fill"+response[i].tcode.toString());
						b.css('transform', 'rotate(' + deg + 'deg)');
						$('#num'+response[i].tcode.toString()).html(percent + '%');
					}
				}
			} else if (response.length == 0) {
				alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	
});


 //공용업무 생성하기
 function ptcreate(pcode){
	 var popW = 500; // 띄울창의 가로사이즈
	 var popH = 400; // 띄울창의 세로사이즈
	 window.open("/project/publicTask/create?pcode="+pcode+"&tsdate="+fixpsdate+"&tedate="+fixpedate,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
 }
 
// 공용업무 삭제
 function ptdel(tcode){
	 event.stopPropagation();
	 if(confirm('업무를 삭제하시겠습니까?')==true){
		$.ajax({
			type : 'DELETE',
			url : '/publictask/' + tcode,
			success : function(response) {
				if (response == 1) {
					alert('공용업무 삭제 성공!');
					location.reload();
				} else if (response == -1) {
					alert('Server or Client ERROR, 공용업무 삭제 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	 }
	 else return;
 }
 
 //공용업무 수정
 function ptedit(date, tcode){
	 event.stopPropagation();
	 var popW = 400; // 띄울창의 가로사이즈
	 var popH = 560; // 띄울창의 세로사이즈
	 
	 var list={};
	 list = date.split(',');
	 
	 if(confirm('업무를 수정하시겠습니까?')==true){
			window.open("/project/publicTask/edit?tsdate="+list[0]+"&tedate="+list[1]+"&tcode="+tcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
	 }
	 else return;
 }
 
 //하위업무로 이동
  function godowntask(tcode){
	event.stopPropagation();
	 if(confirm('하위 업무로 이동하시겠습니까?')==true){
		 $("#ptcreatebtn").hide();
		 $("#publictaskBOTTOM").load("/project/publicTask/downTask?tcode="+tcode); 
		 $btntag='<button class="btn" type="button" onclick="goroottask('+pcode+')" style="background-color:#ed8151; border:0;outline:none; color:white;margin-right:5px;">최상위 공용업무로 이동</button>'
		 +'<button class="btn" type="button" onclick="gotasklist('+pcode+')" style="background-color:#ed8151; border:0;outline:none; color:white;">공용업무 리스트로 이동</button>';
		 $("#publictaskTOP").append($btntag);
	 }else return;
 } 
 
 //개인 업무 생성
 function privateCreate(date,tcode){
	 event.stopPropagation();
	 var popW = 500; // 띄울창의 가로사이즈
	 var popH = 400; // 띄울창의 세로사이즈
	 var list={};
	 list = date.split(',');
	 
	 window.open("/project/privateTask/create?tsdate="+list[0]+"&tedate="+list[1]+"&tcode="+tcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
 }
 
 //하위 업무 생성
 function downtaskcreate(date,tcode){
	 event.stopPropagation();
	 var popW = 500; // 띄울창의 가로사이즈
	 var popH = 400; // 띄울창의 세로사이즈
	 var list={};
	 list=date.split(',');
	 alert(list);
	 window.open("/project/publicTask/downTaskCreate?tsdate="+list[0]+"&tedate="+list[1]+"&tcode="+tcode+"&pcode="+pcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
 	}
  
</script>

</html>