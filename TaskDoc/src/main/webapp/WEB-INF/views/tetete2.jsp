<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
<button type="button" onclick="zz()"></button>
</body>
<script>
function zz(){
var param = {
		'chatRoom' : {
			//개인톡 형식이므로 crmode 2번
			'crmode' : '2',
		},
		'userInfo' : {
			'uid' : 'a',
		},
		'project' : {
			'pcode' : '4',
		}
	};
	$.ajax({
		type : 'POST',
		url : '/chatroom',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response>0) {
				alert('채팅방 생성 완료! 채팅방 crcode값은'+response);
			}
			else if(response<0){
				alert('Server or Client ERROR, 채팅방 생성 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
}
</script>
</html>
