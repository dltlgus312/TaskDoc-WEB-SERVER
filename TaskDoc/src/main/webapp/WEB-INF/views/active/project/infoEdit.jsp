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
/*프로젝트 수정  */
var param = {
			'ptitle' : $("#example"),
			'psubtitle' : $("#example"),
			'psdate' : $("#example"),
			'pedate' : $("#example")
	};
	$.ajax({
		type : 'PUT',
		url : '/www/project',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('프로젝트 수정 완료!');
			}
			else{
				alert('Server or Client ERROR, 프로젝트 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
/*/프로젝트 수정*/

/*프로젝트 삭제  */
	$.ajax({
		type : 'DELETE',
		url : '/www/project/'+ '삭제하고자하는 프로젝트의 PID',
		success : function(response) {
			if (response == 1) {
				alert('프로젝트 삭제 완료!');
			}
			else{
				alert('Server or Client ERROR, 프로젝트 삭제 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
/* /프로젝트 삭제  */

/* 프로젝트에 소속된 유저 리스트불러오기*/
 $.ajax({
		type : 'GET',
		url : '/www/projectjoin/collaboration/'+ '현재 프로젝트 PID',
		success : function(response) {
			/*
			 프로젝트에 참가하는 모든 회원을 검색
			 
			프로젝트 결과 값 = map ( KEY = "userList", "joinList" )
			유저 정보들
			userList{
				uid;
				upasswd;
				uname;
				ustate;
				uphone;
			}
			
			특정 프로젝트에 소속되어있는 회원들의 정보
			joinList{
				pcode;
				uid;
				ppermission;
				pinvite;
			}
			*/
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
/*/프로젝트에 소속된 유저 리스트불러오기*/
 
/* 프로젝트에 소속된 멤버가 탈퇴 OR 강퇴해버리기!*/ 
var param = {
		'pcode' : '내가 소속되어있는 프로젝트의 PCODE',
		'uid':'탈퇴하고싶거나 추방하고싶은 회원의 ID'
	};
	$.ajax({
		type : 'DELETE',
		url : '/www/projectjoin',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('프로젝트 나가기 및 회원 추방 성공');
			}
			else{
				alert('Server or Client ERROR, 프로젝트 나가기 및 회원 추방 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
/*/프로젝트에 소속된 멤버가 탈퇴 OR 강퇴해버리기!*/

</script>
</html>