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

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
//pro_header.jsp , pro_header.js 에서 <script>태그 안에서 변수 사용가능하다.	
var pcode=<%=pcode%>;
$(function(){
	$(".files_hover").css('color','#ed8151').css('border-bottom','1px solid #ed8151');
	$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
	$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
	$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
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
				<div class="container" style="background-color: white; overflow: auto;">
					<%@include file="/WEB-INF/views/active/project/fix/pro_header.jsp"%>
					<div style="width: 100%; height: 93%;">
						<div id="rootbtn" class="bts">
							
						</div>
						
						<div id="publictaskList">
					
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
	//특정 프로젝트의 모든 공용업무를 보여준다.
	$.ajax({
		type : 'GET',
		url : '/publictask/root/' + pcode,
		success : function(response) {
			if (response.length != 0) {
				for(var i=0;i<response.length;i++){
					var $plist='<div id="plist ' + (i+1) + ' " style="width:10%;height:120px; border: 1px solid #ed8151; margin-right:20px; margin-top:20px; float:left;">'
					+'<div style="width:100%;height:80%; cursor:pointer;" onclick="downtaskView('+response[i].tcode+')">'
					+'<img src="${pageContext.request.contextPath }/resources/img/img_filetask.png"style="width:100%;height:100%;"></div>'
					+'<div style="width:100%;height:20%; text-align:center;cursor:pointer; border-top:1px solid #ed8151;" onclick="gofileView('+response[i].tcode+')">'+response[i].ttitle+'</div></div>';
					$("#publictaskList").append($plist);
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

//해당 업무에 대한 다운받을 수 있는 자료를 띄우는 페이지 window.open
function gofileView(tcode){
	event.stopPropagation();
	var screenW = screen.availWidth;  // 스크린 가로사이즈
	var screenH = screen.availHeight; // 스크린 세로사이즈
	var popW = 600; // 띄울창의 가로사이즈
	var popH = 350; // 띄울창의 세로사이즈
	var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
	var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
	window.open("/project/file/downloadForm?tcode="+tcode,"",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
}

//하위 업무 띄우려고 page load
function downtaskView(tcode){
	if(confirm('하위 업무의 파일을 보시겠습니까?')==true){
	 $("#publictaskList").load("/project/file/downview?tcode="+tcode);
	 $btntag=' <button class="btn" type="button" onclick="goroot('+pcode+')" style="outline:none;border:0px; background-color:#ed8151;color:white;">최상위 업무로 이동</button>';
	 $("#rootbtn").append($btntag);
	 }
	else return;
}


</script>

</html>