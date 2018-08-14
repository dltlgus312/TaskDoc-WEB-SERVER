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
	/*회원 정보 수정을위해 정보를 불러오기*/
	/*response는 list형태로 return*/
	$.ajax({
		type : 'GET',
		url : '/www/userinfo/' + '로그인한 ID',
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

	/* 회원 정보 수정 처리*/
	$.ajax({
		type : 'PUT',
		url : '/www/userinfo/',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			/* response 1 or -1
			 */
			if (response == 1) {
				alert('회원 정보 수정 완료');
			} else {
				alert('Server or Client ERROR, 회원정보 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/회원 정보 수정 처리*/
	
	/* 회원 탈퇴*/
	$.ajax({
		type : 'DELETE',
		url : '/www/userinfo/' + '로그인한 ID',
		success : function(response) {
			/* response 1 or -1
			 */
			if (response == 1) {
				alert('회원  탈퇴 완료');
			} else {
				alert('Server or Client ERROR, 회원 탈퇴 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/회원 탈퇴*/
</script>
</html>