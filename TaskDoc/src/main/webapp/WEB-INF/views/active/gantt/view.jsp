<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<script
	src="${pageContext.request.contextPath }/resources/js/project/jsgantt.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/project/jsgantt.css">
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
	$(function() {
		$(".gantt_hover").css('color', '#ed8151').css('border-bottom',
				'1px solid #ed8151');
		$(".chat_hover").css('color', '#6d6d6d').css('border-bottom', 'none');
		$(".ptask_hover").css('color', '#6d6d6d').css('border-bottom', 'none');
		$(".files_hover").css('color', '#6d6d6d').css('border-bottom', 'none');
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
					<div style="width: 100%; height: 93%;">
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
//tsdate!=null tedate!=null인 array 담기
var parrays=new Array();
//정렬된 array
var realplist=new Array();
var sendArray=new Array();
var step=new Array();

$(function(){
	//method item list 불러오기
	$.ajax({
		type : 'GET',
		url : '/publictask/'+<%=pcode%>,
		success : function(response) {
			if (response.length > 0) {
				alert('public list 조회 완료');
				for(var i=0;i<response.length;i++){
					if(response[i].tsdate!=null && response[i].tedate!=null){
						  if(response[i].tcode == response[i].trefference) {
							   response[i].trefference = 0;
						   }
						  parrays.push(response[i]);	
					}
				}
				realplist = treeModel(parrays, 0);
				listmake();
				drawg();
			}
			else  {
				alert('Server or Client ERROR, method item list 조회 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	var treeModel = function (arrayList, rootId) {
		var rootNodes = [];
		var traverse = function (nodes, item, index) {
			if (nodes instanceof Array) {
				return nodes.some(function (node) {
					if (node.tcode === item.trefference) {
						node.children = node.children || [];
						return node.children.push(arrayList.splice(index, 1)[0]);
					}
	
					return traverse(node.children, item, index);
				});
			}
		};
	
		while (arrayList.length > 0) {
			arrayList.some(function (item, index) {
				if (item.trefference === rootId) {
					return rootNodes.push(arrayList.splice(index, 1)[0]);
				}
	
				return traverse(rootNodes, item, index);
			});
		}
	
		return rootNodes;
	};
	
	function listmake(){
		//for문으로 업무생성
		 for(var i=0;i<realplist.length;i++){
				if(realplist[i].children != null){
					sendArray.push(realplist[i]);
					step.push(i+1);
					createListDiv(realplist[i].children, i+1);
			 	} 
				
				else {	
					sendArray.push(realplist[i]);
					step.push(i+1);
			}
		}
	}
	
	 
	 function createListDiv(list, parrenti) {
			for(var i= 0; i<list.length; i++) {
				var str = parrenti +''+ (i+1);
				if(list[i].children != null) {
					sendArray.push(list[i]);
					step.push(str);
					createListDiv(list[i].children, str);
				} else {
					sendArray.push(list[i]);
					step.push(str);
				}
			}
		}
	 function drawg(){
		   var g = new JSGantt.GanttChart(document.getElementById('GanttChartDIV'), 'day');
			/* for(var j=0;j<sendArray.length;j++){
				g.AddTaskItem(new JSGantt.TaskItem( parseInt(step[j]),  sendArray[j].ttitle.toString(),sendArray[j].tsdate.toString() , sendArray[j].tedate.toString(),          'ggroupblack',  '',       0, 'Brian',   parseInt(sendArray[j].tpercent),   1, 0,  1, '',      '',      'Some Notes text', g ));
			} */
			
			if( g.getDivId() != null ) {
				//설정
				g.setCaptionType('Complete');
				g.setQuarterColWidth(36);
				g.setDateTaskTableDisplayFormat('yyyy-mm-dd');
				g.setDateTaskDisplayFormat('day dd month yyyy');
				g.setDayMajorDateDisplayFormat('yyyy/mm - ww 주차');
				g.setWeekMinorDateDisplayFormat('dd mon');
				//g.setShowTaskInfoLink(1);
				g.setUseToolTip(0); //툴팁 잠시안보이게
				g.setShowEndWeekDate(0);
				g.setUseSingleCell(10000);
				g.setFormatArr('Day', 'Week', 'Month');
				
				
				for(var j=0;j<sendArray.length;j++){
					g.AddTaskItem(new JSGantt.TaskItem(parseInt(step[j]), sendArray[j].ttitle, sendArray[j].tsdate, sendArray[j].tedate,'ggroupblack','',0, 'Brian', 50,1,0, 1,'','','Some Notes text', g ));
				}
				/* g.AddTaskItem(new JSGantt.TaskItem(11,  'Chart Object','2016-02-20','2016-02-20', 'gmilestone', '', 1,'Shlomy', 100, 0, 1,  1, '', '', '', g));
				g.AddTaskItem(new JSGantt.TaskItem(12,  'Task Objects',         '',           '',          'ggroupblack',  '',       0, 'Shlomy',   40,  1, 1,  1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(121, 'Constructor Proc',     '2016-02-21','2016-03-09', 'gtaskblue',    '',       0, 'Brian T.', 60,  0, 12, 1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(122, 'Task Variables',       '2016-03-06','2016-03-11', 'gtaskred',     '',       0, 'Brian',    60,  0, 12, 1, 121,     '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(123, 'Task by Minute/Hour',  '2016-03-09','2016-03-14 12:00', 'gtaskyellow', '',  0, 'Ilan',     60,  0, 12, 1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(124, 'Task Functions',       '2016-03-09','2016-03-29', 'gtaskred',     '',       0, 'Anyone',   60,  0, 12, 1, '123SS', 'This is a caption', null, g));
				g.AddTaskItem(new JSGantt.TaskItem(2,   'Create HTML Shell',    '2016-03-24','2016-03-24', 'gtaskyellow',  '',       0, 'Brian',    20,  0, 0,  1, 122,     '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(3,   'Code Javascript',      '',           '',          'ggroupblack',  '',       0, 'Brian',    0,   1, 0,  1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(31,  'Define Variables',     '2016-02-25','2016-03-17', 'gtaskpurple',  '',       0, 'Brian',    30,  0, 3,  1, '',      'Caption 1','',   g));
				g.AddTaskItem(new JSGantt.TaskItem(32,  'Calculate Chart Size', '2016-03-15','2016-03-24', 'gtaskgreen',   '',       0, 'Shlomy',   40,  0, 3,  1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(33,  'Draw Task Items',      '',           '',          'ggroupblack',  '',       0, 'Someone',  40,  2, 3,  1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(332, 'Task Label Table',     '2016-03-06','2016-03-09', 'gtaskblue',    '',       0, 'Brian',    60,  0, 33, 1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(333, 'Task Scrolling Grid',  '2016-03-11','2016-03-20', 'gtaskblue',    '',       0, 'Brian',    0,   0, 33, 1, '332',   '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(34,  'Draw Task Bars',       '',           '',          'ggroupblack',  '',       0, 'Anybody',  60,  1, 3,  0, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(341, 'Loop each Task',       '2016-03-26','2016-04-11', 'gtaskred',     '',       0, 'Brian',    60,  0, 34, 1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(342, 'Calculate Start/Stop', '2016-04-12','2016-05-18', 'gtaskpink',    '',       0, 'Brian',    60,  0, 34, 1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(343, 'Draw Task Div',        '2016-05-13','2016-05-17', 'gtaskred',     '',       0, 'Brian',    60,  0, 34, 1, '',      '',      '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(344, 'Draw Completion Div',  '2016-05-17','2016-06-04', 'gtaskred',     '',       0, 'Brian',    60,  0, 34, 1, "342,343",'',     '',      g));
				g.AddTaskItem(new JSGantt.TaskItem(35,  'Make Updates',         '2016-07-17','2017-09-04', 'gtaskpurple',  '',       0, 'Brian',    30,  0, 3,  1, '333',   '',      '',      g));  */
				g.Draw(); 
			}
	 }
});


</script>
</html>