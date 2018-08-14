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
/*프로젝트 유저 초대  */
var param = {
		'userinfo' : {
			'uid' : $("#example"),
		},
		'project' : {
			'ptitle' : $("#example"),
			'psubtitle' : $("#example"),
			'psdate' : $("#example"),
			'pedate' : $("#example")
		}
	};
	$.ajax({
		type : 'POST',
		url : '/www/project/',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('프로젝트 생성 완료!');
			}
			else{
				alert('Server or Client ERROR, 프로젝트 생성 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
</script>
</html>