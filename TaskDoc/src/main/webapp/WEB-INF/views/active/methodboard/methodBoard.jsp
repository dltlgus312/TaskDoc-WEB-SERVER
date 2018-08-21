<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode = request.getParameter("pcode");
%>
<script type="text/javascript">
var id='<%=loginid%>';
if(id=="null"){
	alert('로그인이 필요한 페이지입니다.');
	window.location.href='/';
}
</script>
</head>

<body>
	<script type="text/javascript">

//게시판 생성
var param = {
			'mbtitle' : $("#ptitle").val(),
			'mbcontents' : $("#psdate").val(),
			'pcode' : $("#pedate").val(),
			'uid' : '<%=loginid%>'
		};
		$.ajax({
			type : 'POST',
			url : '/methodboard',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response>0) {
					alert('게시판 생성 완료! 게시판의 mbcode값은' + response);
				} else{
					alert('Server or Client ERROR, 게시판 생성 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
//게시판 생성
	</script>
</body>
</html>