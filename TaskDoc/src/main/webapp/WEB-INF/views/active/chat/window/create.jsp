<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" onclick="chatroom()">버튼</button>

<script type="text/javascript">
//채팅방 생성
function chatroom(){
	var param = {
			'chatRoom' : {
				//개인톡 형식이므로 crmode 2번
				'crmode' : '2',
			},
			'userInfo' : {
				'uid' : 'a',
			},
			'project' : {
				'pcode' : '5',
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
//채팅방 생성
</script>
	
</body>
</html>