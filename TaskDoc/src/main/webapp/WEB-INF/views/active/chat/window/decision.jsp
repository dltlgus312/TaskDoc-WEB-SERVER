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
	/* 의사결정 생성*/
	var param = {
		'dstitle' :'의사결정 제목',
		'crcode' :'의사결정만들 채팅방 CRCODE',
		'tcode' :'어떤 공용업무에 대한 의사결정을 만들것인지 TCODE'
	};
	$.ajax({
		type : 'POST',
		url : 'decision',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response != -1) {
				alert('의사결정 생성 완료! ' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 의사결정 생성 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/의사결정 생성 */
	
	/* 의사결정 삭제*/
	$.ajax({
		type : 'DELETE',
		url : 'decision/'+'삭제할 의사결정코드 DSCODE',
		success : function(response) {
			if (response == 1) {
				alert('의사결정 삭제 완료! ' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 의사결정 삭제 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/의사결정 삭제 */
	
	/* 의사결정 수정*/
	var param = {
		'tcode' :'어떤 공용업무로  의사결정을 이동할것인지 TCODE',
		'dstitle' :'의사결정 제목',
		'dsclose' :'0이면아직안끝남 1이면 끝남',
		'dscode' :'어떤의사결정 코드 수정할것인지'
	};
	$.ajax({
		type : 'PUT',
		url : 'decision',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('의사결정 수정 완료! ' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 의사결정 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/의사결정 수정 */
	
	/* 해당 채팅방 내의 모든 의사결정 리스트를 가져온다 */
	$.ajax({
		type : 'GET',
		url : 'decision/room/' + '해당 공용업무의  tcode',
		success : function(response) {
			if (response.length != 0) {
				alert('의사결정 리스트 불러오기 성공!');
			} else if (response.length == 0) {
				alert('Server or Client ERROR, 의사결정 리스트 불러오기  실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/해당 채팅방 내의 모든 의사결정 리스트를 가져온다 */
	
	
</script>
</html>