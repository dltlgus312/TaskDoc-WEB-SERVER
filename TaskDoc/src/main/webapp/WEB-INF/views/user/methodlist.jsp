<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
%>

</head>
<body>
<table class="table table-striped table-hover" style="width:100%;">
	<thead>
		<tr style="width:100%;">
			<th style="width: 20%;">게시글 코드</th>
			<th style="width: 50%;">방법론 제목</th>
			<th style="width: 30%;">★</th>
		</tr>
	</thead>
	<tbody id="tbodys">
	</tbody>
</table>
</body>
<script type="text/javascript">
$.ajax({
	type : 'GET',
	url : '/methodlist/' + '<%=loginid%>',
	success : function(response) {
		if(response.length>0){
			for(var i=0;i<response.length;i++){
				var $div='<tr><td style="vertical-align:middle;">'+response[i].mbcode+'</td>'
				+'<td style="bts">'+response[i].mltitle+'</td><td><button onclick="goBoard('+response[i].mbcode+')" class="btn" style="outline:none;border:0px;background-color:#ed8151;color:white;">해당 게시글로 이동</button></td></tr>'
				$("#tbodys").append($div);
			}
		}else{
			alert('다운 받을 자료가 없습니다.');
			window.close();
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
}); 

function goBoard(mbcode){
	if(confirm('해당 방법론이있는 게시글로 이동하시겠습니까?')==true){
		window.close();
		opener.location.href="/methodboard/view?mbcode="+mbcode;
	}
	else return;
}
</script>
</html>