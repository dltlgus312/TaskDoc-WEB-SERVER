<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
<script>
var param = {
		'crcode' : 67,
		'pcode' : 61
	};
	$.ajax({
		type : 'POST',
		url : '/chatroomjoin/user',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response.length != -1) {
				alert('채팅방 유저 리스트 조회 성공!' + response[0]);
			} else if (response.length == 0) {
				alert('Server or Client ERROR, 채팅방 유저 리스트 조회 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});

</script>