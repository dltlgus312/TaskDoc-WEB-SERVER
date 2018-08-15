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
	/*공용 업무 생성 */
	/* var param = {
		'ttitle' :'publicTASK 1';
		'tcolor' : 'RED';
		'tsdate' :;
		tedate;
		tpercent;
		tsequence;
		trefference;
		pcode;
	}; */
	/*공용 업무 생성 */
	var param = {
		'ttitle' : ' ',
		'tcolor' : ' ',
		'tsdate' : ' ',
		'tedate' : ' ',
		'pcode' : '현재 프로젝트 PCODE'
	};
	$.ajax({
		type : 'POST',
		url : 'publictask',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response != -1) {
				alert('공용업무 생성 완료! 프로젝트의 공용업무의 id값은' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 공용업무 생성 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/공용 업무 생성 */

	/*공용 업무안의 새로운 공용 업무 생성 */
	var param = {
		'ttitle' : ' ',
		'tcolor' : ' ',
		'tsdate' : ' ',
		'tedate' : ' ',
		'trefference' : '공용업무안의 새로운공용업무를 생성하기위해 부모의 공용업무 값을넣어준다.',
		'pcode' : '현재 프로젝트 PCODE'
	};
	$.ajax({
		type : 'POST',
		url : 'publictask',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response != -1) {
				alert('공용업무 생성 완료! 프로젝트의 공용업무의 id값은' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 공용업무 생성 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/공용 업무 생성 */

	/* 특정 프로젝트의 모든 공용업무를 보여준다. */
	$.ajax({
		type : 'GET',
		url : 'publictask/' + '7',
		success : function(response) {
			if (response.length != 0) {
				alert('공용업무 리스트 불러오기 성공!');
			} else if (response.length == 0) {
				alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/특정 프로젝트의 모든 공용업무를 보여준다. */

	/* 공용업무 수정. */
	var param = {
		'ttitle' : '바꿀제목',
		'tcolor' : '바꿀색상',
		'tsdate' : '바꿀시작날짜',
		'tedate' : '바꿀끝날날짜',
		'tpercent' : '바꿀 퍼센터',
		'trefference' : '어느 업무를 참조하여 하위 공용업무로 바꿀것인가',
		'tsequence' : '바꿀 순서',
		'tcode' : '바꾸려고하는 업무의 TCODE'
	};
	$.ajax({
		type : 'PUT',
		url : 'publictask',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('공용업무 수정 완료!');
			} else if (response == -1) {
				alert('Server or Client ERROR, 공용업무 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/공용업무 수정. */
	
	/* 공용업무 삭제. */
			$.ajax({
				type : 'DELETE',
				url : 'publictask/'+'삭제하고싶은 공용업무 TCODE',
				success : function(response) {
					if (response == 1) {
						alert('공용업무 삭제 성공!');
					} else if (response == -1) {
						alert('Server or Client ERROR, 공용업무 삭제 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		/*/공용업무 삭제. */
</script>
</html>