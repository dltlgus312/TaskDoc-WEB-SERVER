<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>

<script type="text/javascript">

// 개인업무 내 모든 메모 조회
$.ajax({
	type : 'GET',
	url : 'memo/' + '메모를 조회할 개인업무 PTCODE',
	success : function(response) {
		if (response.length != -1) {
			alert('메모 조회 완료!' + response);
		} else if (response.length == 0) {
			alert('Server or Client ERROR, 메모 조회 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
// /개인업무 내 모든 메모 조회


// 개인업무 내 메모 생성
var param = {
		'ptcode': '메모를 생성할 개인업무 PTCODE',
		'mcontents' : '메모 내용'
};
$.ajax({
	type : 'POST',
	url : 'memo',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		if (response != -1) {
			alert('메모 생성 완료! 메모의 mcode값은' + response);
		} else if (response == -1) {
			alert('Server or Client ERROR, 메모 생성 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
// /개인업무 내 메모 생성

// 개인업무 내 메모 수정
	var param = {
		'mcontents' : '수정할 메모 내용',
		'mcode' : '수정할메모의 MCODE'
	};
	$.ajax({
		type : 'PUT',
		url : 'memo',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('메모 수정 완료! 메모의 mcode값은' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 메모 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	// /개인업무 내 메모 수정
	
	// 개인업무 내 메모 삭제
	$.ajax({
		type : 'DELETE',
		url : 'memo/'+'삭제할 메모의 MCODE',
		success : function(response) {
			if (response == 1) {
				alert('메모 삭제 완료!');
			} else if (response == -1) {
				alert('Server or Client ERROR, 메모 삭제 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	// /개인업무 내 메모 삭제
	
</script>
</html>