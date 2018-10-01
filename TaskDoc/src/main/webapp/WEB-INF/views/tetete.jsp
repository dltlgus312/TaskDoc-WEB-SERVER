<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	<div style="width: 100%; height: 1200px; display: -webkit-box;">
		<div style="width: 25%; height: 100%; background-color: red;">
			공용업무
			<button type="button" id="task1">업무1</button>
		</div>
		<div style="width: 25%; height: 100%; background-color: yellow;">
			세부업무
			<button type="button" id="sebu1" style="display: none;">세부업무1</button>
			<button type="button" id="sebu2" style="display: none;">세부업무2</button>
		</div>
		<div style="width: 25%; height: 100%; background-color: green;">
			개인업무
			<button type="button" id="gein1" style="display: none;">개인업무1</button>
		</div>
		<div style="width: 25%; height: 100%; background-color: gray;">완료된업무
		</div>
	</div>
</body>
<script type="text/javascript">
$("#task1").on("click",function(){
	var dp = document.getElementById("sebu1").style.display;
	var dp2 = document.getElementById("sebu2").style.display;
	if(dp=='none' && dp2=='none'){
		$("#sebu1").show();
		$("#sebu2").show();
		document.getElementById("sebu1").style.display='block';
		document.getElementById("sebu2").style.display='block';
	}
	else if(dp=='block' && dp=='block'){
		$("#sebu1").hide();
		$("#sebu2").hide();
		$("#gein1").hide();
		document.getElementById("sebu1").style.display='none';
		document.getElementById("sebu2").style.display='none';
	}
});

 $("#sebu1").on("click",function(){
	 if( $("#sebu1").css("display") != "none" ) {
		    $("#gein1").show();
		    document.getElementById("gein").style.display='block';
		}
}); 

</script>
  <form action="/document/upload" enctype="multipart/form-data" method="POST">
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
   </form>
</html>