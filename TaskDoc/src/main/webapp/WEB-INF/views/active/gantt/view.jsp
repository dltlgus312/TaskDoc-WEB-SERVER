<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/project/jsgantt.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/project/jsgantt.css" >
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
	$(".gantt_hover").css('color','#ed8151').css('border-bottom','1px solid #ed8151');
	$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
	$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
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

					<!-- CHAT CONTENTS  -->
					<div  style="width: 100%; height: 93%;">
					<div style="position:relative" class="gantt" id="GanttChartDIV"></div>
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
	var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');
	g.setShowRes(1); // Show/Hide Responsible (0/1)
	g.setShowDur(1); // Show/Hide Duration (0/1)
	g.setShowComp(1); // Show/Hide % Complete(0/1)
	g.setCaptionType('Resource');  // Set to Show Caption
/* 	g.setDateInputFormat ('yyyy-mm-dd');
 */	if( g ) { 
		
		$.ajax({
			type : 'GET',
			url : '/publictask/' + pcode,
			success : function(response) {
				if (response.length>0) {
					alert('공용 업무 조회 성공!');
					for(var i=0;i<response.length;i++){
						g.AddTaskItem(new JSGantt.TaskItem(i, response[i].ttitle,'3/18/2018', '5/18/2018',response[i].tcolor, '', 0, 'TaskDoc',response[i].tpercent, 0, 0, 1));
					}
				} else {
					alert('Server or Client ERROR, 공용 업무 조회 실패');
				}
				g.Draw();	
				g.DrawDependencies();
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
			//'pid' , '제목' , '시작날짜' , '끝나는날짜', '색상' , '링크(비워놔도됨)' ,'끝냈는여부 0->진행중 1->종료' , '이름' , '퍼센트','업무접을지여부(0->안접음 1->접음)','부모pid(내가부모면 0)',1,'화살표표시'
		   /*  g.AddTaskItem(new JSGantt.TaskItem(1,  '테스트1','2/20/2018', '6/10/2018', 'ff00ff', '', 0, 'Dongho1','', 1, 0, 1));
		    g.AddTaskItem(new JSGantt.TaskItem(11, '테스트1-1','2/25/2018', '2/31/2018','00ff00', '', 0, 'Dongho1-1',40, 0, 1, 1,1));
		    g.AddTaskItem(new JSGantt.TaskItem(12,'테스트1-2','2/25/2018', '2/31/2018','00ff00', '', 0, 'Dongho1-2',40, 0, 1, 1,1)); */
	}
	else{alert("not defined");}
</script>

</html>