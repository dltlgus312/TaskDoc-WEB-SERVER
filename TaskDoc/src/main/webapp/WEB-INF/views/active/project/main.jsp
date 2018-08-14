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
/* 내가 참가하는 모든 프로젝트를 검색*/
$.ajax({
		type : 'GET',
		url : '/www/projectjoin/'+'현재 접속한 ID',
		success : function(response) {
			/*
			response는 map 형태로 날라옴
			프로젝트 결과 값 = map ( KEY = "projectList", "projectJoinList" )
			프로젝트에 소속되어있는 정보들
			projectJoinList{
				pcode;
			 	uid;
			 	ppermission;
			 	pinvite;
			}
			
			프로젝트들의 정보
			projectList{
				pcode;
				ptitle;
				psubtitle;
				psdate;
				pedate;	
			}
			
			pcode별로 프로젝트 list 나열하고, 프로젝트별 title, subtitle, psdate, pedate 설정하기
			*/
			
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});

/* /내가 참가하는 모든 프로젝트를 검색*/

/* 프로젝트에 사람 초대 */
var param={
		'pcode': '현재 PCODE',
		'uid': '초대할 ID',
		'ppermission': 'MEMBER',
		'pinvite': 0
};
$.ajax({
		type : 'POST',
		url : '/www/projectjoin',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('프로젝트에 사람 초대 완료!');
			}
			else{
				alert('Server or Client ERROR, 프로젝트에 사람 초대  실패!');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});

/*/프로젝트에 사람 초대 */


/* 프로젝트에 초대받은사람 수락할때  
 * projectjoin_SQL 다시알아보기★★★★★★★★★★★★★★★★★★★★★★★★★★★★
 */
var param={
		'pcode': '현재 PCODE',
		'uid': '현재 수락할 ID',
		'ppermission': 'MEMBER',
		'pinvite': 1
};
$.ajax({
		type : 'PUT',
		url : '/www/projectjoin',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('초대 수락 완료!');
			}
			else{
				alert('Server or Client ERROR, 초대 수락  실패!');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
/*/프로젝트에 초대받은사람 수락할때 */
</script>
</html>