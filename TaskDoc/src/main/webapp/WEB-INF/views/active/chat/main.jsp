<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		/* 프로젝트내에서 내가 참여하고 있는 채팅방 리스트 ( focus 제외 )*/
		// --> 400 ERROR 발생
		var param = {
			'uid' : '현재 UID',
			'pcode' : '내 프로젝트 PCODE'
		};
		$.ajax({
			type : 'GET',
			url : 'chatroomjoin/room',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 리스트 조회 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 리스트 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/프로젝트내에서 내가 참여하고 있는 채팅방 리스트 ( focus 제외 ) */

		/* 채팅방에 참여 중인 유저 리스트 */
		// --> 400 ERROR 발생
		var param = {
			'crcode' : '현재 채팅방  CROCODE',
			'pcode' : '내 프로젝트  PCODE'
		};
		$.ajax({
			type : 'GET',
			url : 'chatroomjoin/user',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 유저 리스트 조회 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 유저 리스트 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅방에 참여 중인 유저 리스트 */
		
		/* 채팅방에 참여 중인 유저 리스트 */
		var param = {
			'pcode' : '내 프로젝트  PCODE',
			'crcode' : '현재 채팅방  CROCODE',
			'uid' : '초대할 회원의 UID'
		};
		$.ajax({
			type : 'POST',
			url : 'chatroomjoin',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 유저 초대 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 유저 초대 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅방에 참여 중인 유저 리스트 */
		
		/* 채팅방에서 나가기 */
		var param = {
			'pcode' : '내 프로젝트  PCODE',
			'crcode' : '현재 채팅방  CROCODE',
			'uid' : '채팅방 나갈 회원의 UID'
		};
		$.ajax({
			type : 'DELETE',
			url : 'chatroomjoin',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 나가기 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 나가기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅방에서 나가기 */
		
		
		/* 채팅 내용 DB저장 dmcode=null, dscode=null, crcoderef=null일경우
		일반 채팅 내용이다.
		*/
		var param = {
			'crcode' :'현재 채팅방 코드 CRCODE',
			'uid' :'채팅입력하고있는 UID',
			'ccontents' :'채팅내용저장',
		 	'dmcode' :'자료(파일)일경우 채팅창에표시하기위한것(채팅창에는 자료이름표시)',
			'dscode' :'의사결정일경우 채팅창에표시하기위한것(채팅창에는 의사결정제목표시)',
			'crcoderef' :'회의록채팅내용일경우 코드가필요하다' 
		};
		$.ajax({
			type : 'POST',
			url : 'chatcontents',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅 내용 입력성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 내용 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅 내용 DB저장 dmcode=null, dscode=null, crcoderef=null일경우
		일반 채팅 내용이다.
		*/
		
		/* 채팅 내용 조회 해보자.*/
		$.ajax({
			type : 'GET',
			url : 'chatcontents/'+'채팅내용을조회할 채팅방코드 crcode',
			success : function(response) {
				if (response.length != -1) {
					alert('채팅 내용 조회 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 내용 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅 내용 조회 해보자.*/
	</script>

</body>
</html>