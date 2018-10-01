<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/project/jsgantt.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/project/jsgantt.css" >
</head>


<body>
 <!-- dmtitle, crcode, uid, [tcode]  --> 
	<!-- <div style="position:relative" class="gantt" id="GanttChartDIV"></div> -->

 <form action="/document/upload" enctype="multipart/form-data" method="POST">
      <input name="dmtitle" value="테스트1"/>
      <input name="dmcontents" value="테스트 자료입니다."/>
      <input name="crcode" value="1"/>
      <input name="tcode" value="33"/>
      <input name="uid" value="a"/>
      <input type="file" name="file"/>
      <input type="submit">
</form>	 

<form action="/file/download/4" method="POST">
		<input type="submit" value="다운로드">
</form>


</body>

<script type="text/javascript">

  /* var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');
  g.setShowRes(1); // Show/Hide Responsible (0/1)
  g.setShowDur(1); // Show/Hide Duration (0/1)
  g.setShowComp(1); // Show/Hide % Complete(0/1)
  g.setCaptionType('Resource');  // Set to Show Caption

  if( g ) {

    g.AddTaskItem(new JSGantt.TaskItem(1,   '1',     '',          '',          'ff0000', 'http://help.com', 0, 'Brian',     0, 1, 0, 1));
    g.AddTaskItem(new JSGantt.TaskItem(11,  '1-1',         '9/10/2018', '9/27/2018', 'ff00ff', 'http://www.yahoo.com', 1, 'Shlomy',  100, 0, 1, 1));
    g.Draw();	
    g.DrawDependencies();
  }
  else
  {
    alert("not defined");
  } */

</script>
</html>