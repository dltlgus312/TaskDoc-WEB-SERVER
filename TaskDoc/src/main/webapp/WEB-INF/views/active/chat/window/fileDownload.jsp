<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
String dmcode=request.getParameter("dmcode");
%>
</head>
<body>
<table class="table table-striped table-hover" style="width:100%;">
	<thead>
		<tr style="width:100%;">
			<th style="width: 15%;">자료제목</th>
			<th style="width: 30%;">자료내용</th>
			<th style="width: 25%;">파일이름</th>
			<th style="width: 10%;">아이디</th>
			<th style="width: 20%;">날짜</th>
		</tr>
	</thead>
	<tbody id="tbodys">
	</tbody>
</table>
</body>
<script type="text/javascript">
$.ajax({
	type : 'GET',
	url : '/document/' + <%=dmcode%>,
	success : function(response) {
		if(response.file.length>0){
			for(var i=0;i<response.file.length;i++){
				var $div='<tr><td>'+response.document.dmtitle+'</td><td>'+response.document.dmcontents+'</td>'
				+'<td>'+response.file[i].fname+'<form action="/file/download/'+response.file[i].fcode+'" method="POST"><input type="submit" value="다운로드"></form>'
				+'</td><td>'+response.document.uid+'</td><td>'+response.document.dmdate+'</td></tr>';
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
</script>
</html>