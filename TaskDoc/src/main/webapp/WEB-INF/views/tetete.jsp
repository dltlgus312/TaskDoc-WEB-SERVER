<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

	<style>
		.progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; }
		.bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
		.percent { position:absolute; display:inline-block; top:3px; left:48%; }
	</style>
	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/project/jsgantt.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/project/jsgantt.css" >
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
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
      <input type="submit" value="upload">
</form>	 

<div class="progress">
    <div class="bar"></div>
    <div class="percent">0%</div>
</div>
<div id="status"></div>


</body>

<script type="text/javascript">
$(function() {
    var bar = $('.bar');
    var percent = $('.percent');
    var status = $('#status');
    $('form').ajaxForm({
        beforeSend: function() {
            status.empty();
            var percentVal = '0%';
            bar.width(percentVal);
            percent.html(percentVal);
        },
        uploadProgress: function(event, position, total, percentComplete) {
            var percentVal = percentComplete + '%';
            bar.width(percentVal);
            percent.html(percentVal);
        },
        complete: function(xhr) {
            status.html(xhr.responseText);
        }
        
    });
}); 
  /* 
  var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');
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
<<<<<<< HEAD
<!--   <form action="/document/upload" enctype="multipart/form-data" method="POST">
      <input name="dmtitle" value="test"/>
      <input name="dmcontents" value="testtest"/>
      <input name="crcode" value="1"/>
      <input name="tcode" value="2"/>
      <input name="uid" value="d"/>
      
      <input type="file" name="file"/>
      <input type="file" name="file"/>
      <input type="file" name="file"/>
      <input type="file" name="file"/>

      <input type="submit">
<<<<<<< HEAD
   </form> -->
=======
   </form>
   
   <form action="/file/download/1" method="POST">
   	<input type="submit"/>
   </form>
>>>>>>> branch 'SQL_DTO' of https://github.com/dltlgus312/TaskDoc.git
=======
>>>>>>> refs/heads/sql_dongho
</html>