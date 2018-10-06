<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">
//개인업무 내 메모 수정
var param = {
	'mcontents' : '수정할 메모 내용',
	'mcode' : '수정할메모의 MCODE'
};
$.ajax({
	type : 'PUT',
	url : 'memo',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		if (response == 1) {
			alert('메모 수정 완료! 메모의 mcode값은' + response);
		} else if (response == -1) {
			alert('Server or Client ERROR, 메모 수정 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
// /개인업무 내 메모 수정
</script>
</html>