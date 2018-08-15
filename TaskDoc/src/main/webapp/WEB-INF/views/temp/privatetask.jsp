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
/* 공용업무내 개인업무 생성. */
var param = {
	'pttitle' : 'test개인업무',
	'ptcolor' : 'test개인업무색상',
	'ptsdate' : '20180815',
	'ptedate' : '20180915',
	'tcode' : '5',
	'uid' : 'a'
};
$.ajax({
	type : 'POST',
	url : 'privatetask',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		if (response != -1) {
			alert('개인업무 생성 완료' + response);
		} else if (response == -1) {
			alert('Server or Client ERROR, 개인업무 생성 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
/*/공용업무내 개인업무 생성.  */

/* 공용업무내 개인업무 생성. 
		   ptrefference가 존재할 경우에는 개인업무 내에 개인업무를생성하는것이다
		*/
		var param = {
			'pttitle' : 'test개인업무내개인업무',
			'ptcolor' : 'test개인업무색상',
			'ptsdate' : '20180505',
			'ptedate' : '20180404',
			'ptrefference' : '1',
			'tcode' : '5',
			'uid' : 'a'
		};
		$.ajax({
			type : 'POST',
			url : 'privatetask',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response != -1) {
					alert('개인업무 생성 완료' + response);
				} else if (response == -1) {
					alert('Server or Client ERROR, 개인업무 생성 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/공용업무내 개인업무 생성.  */

		
	/* 특정 유저의 아이디로 특정유저의 모든 개인업무를 불러오자 */
		$.ajax({
			type : 'GET',
			url : 'privatetask/user/' + '회원ID',
			success : function(response) {
				if (response.length != 0) {
					alert('특정유저의 개인업무 불러오기 성공' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 특정유저의 개인업무 불러오기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/특정 유저의 아이디로 특정유저의 모든 개인업무를 불러오자  */
		
		
		/* 특정 공용업무 내 모든 개인업무를 불러오자 */
		$.ajax({
			type : 'GET',
			url : 'privatetask/task/' + '공용업무코드',
			success : function(response) {
				if (response.length != 0) {
					alert('공용업무 내 모든 개인업무를 불러오기 성공' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 공용업무 내 모든 개인업무를 불러오기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/특정 공용업무 내 모든 개인업무를 불러오자  */
		
		/* 개인업무수정하자. */
		var param = {
			'pttitle' : '수정할개인업무명',
			'ptcolor' : '수정할개인업무색상',
			'ptsdate' : '수정할개인업무시작날짜',
			'ptedate' : '수정할개인업무끝날날짜',
			'ptpercent' : '수정할 업무 진행도',
			'ptsequence' : '수정할 업무 순서',
			'ptrefference' : '수정할업무를 어느 부모 개인업무로바꿀것인지',
			'ptcode' : '수정할업무의 PTCODE(어떤개인업무수정할거냐)',
		};
		$.ajax({
			type : 'PUT',
			url : 'privatetask',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response == 1) {
					alert('개인업무 수정 완료' + response);
				} else if (response == -1) {
					alert('Server or Client ERROR, 개인업무 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/개인업무수정하자.  */
		
		/* 개인업무지우자.  */
		$.ajax({
			type : 'DELETE',
			url : 'privatetask/' + '지울공용업무코드',
			success : function(response) {
				if (response == 1) {
					alert('개인업무지우기 성공' + response);
				} else if (response == -1) {
					alert('Server or Client ERROR,개인업무지우기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/* /개인업무지우자. */
 
</script>



		
</body>
</html>