<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/fix/session.js"></script>

</head>
<body>
<button type="button" onclick="chatroom()">버튼</button>


<script type="text/javascript">
//프로젝트 채팅방말고 일반채팅방 생성
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
//채팅방 생성
</script>
	
</body>
</html>