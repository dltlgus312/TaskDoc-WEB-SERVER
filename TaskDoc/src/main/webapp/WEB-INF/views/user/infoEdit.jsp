<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<button onclick="testBtn">버턴</button>
</body>

<script type="text/javascript">
	/*회원 정보 수정을위해 정보를 불러오기*/
	/*response는 list형태로 return*/
	function testBtn() {
		$.ajax({
			type : 'GET',
			url : '/www/userinfo/' + 'a',
			success : function(response) {
				if (response == null) {
					alert('Server or Client ERROR, 회원정보 불러오기 실패');
				} else {
					alert('Server or Client ERROR, 회원정보 불러오기 성공');

				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/회원 정보 수정을위해 정보를 불러오기*/
	}
	
	
	
</script>
</html>