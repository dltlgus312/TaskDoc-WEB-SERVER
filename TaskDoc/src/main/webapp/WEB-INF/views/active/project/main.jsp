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
/* 나의 프로젝트 리스트*/
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

/*/나의 프로젝트 리스트*/

/* 프로젝트 인원 초대 , 수정 , 삭제 기능들......*/

</script>
</html>