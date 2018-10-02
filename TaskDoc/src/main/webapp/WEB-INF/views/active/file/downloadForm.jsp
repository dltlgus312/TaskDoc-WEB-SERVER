<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<%
String tcode=request.getParameter("tcode");
%>
</head>
<body>
<table class="table table-striped table-hover" style="width:100%;">
	<thead>
		<tr style="width:100%;">
			<th style="width: 15%;">자료제목</th>
			<th style="width: 30%;">자료내용</th>
			<th style="width: 15%;">파일이름</th>
			<th style="width: 20%;">아이디</th>
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
	url : '/document/task/' + <%=tcode%>,
	success : function(response) {
		if(response.length>0){
			for(var i=0;i<response.length;i++){
				var $div='<tr><td>'+response[i].dmtitle+'</td><td>'+response[i].dmcontents+'</td>'
				+'<td>파일이름</td><td>'+response[i].uid+'</td><td>'+response[i].dmdate+'</td></tr>';
				$("#tbodys").append($div);
			}
		}else{
			alert('다운받을 자료가 없습니다.');
			window.close();
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
</script>
</html>