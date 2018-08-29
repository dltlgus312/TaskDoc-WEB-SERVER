<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
String loginid="";
loginid=(String)session.getAttribute("loginid");
%>
<script type="text/javascript">
var id='<%=loginid%>';
if(id=="null"){
	alert('로그인이 필요한 페이지입니다.');
	window.location.href='/';
}
</script>
</head>
<body>

</body>

<script type="text/javascript">
/* 현재 프로젝트의 모든 공지사항 리스트*/
$.ajax({
	type : 'GET',
	url : 'notice/project/'+'현재 프로젝트 ID',
	success : function(response) {
		/*
		response는 List 형태로 날라옴
		ncode : ? ,  , ntitle : ?, ndate : ?
		JSON.parser 이용해서 js 변수에 담아서 뿌려보자.
		*/
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
/* /현재 프로젝트의 모든 공지사항 리스트*/

/* 내가클릭한 공지사항의 상세내용  */
$.ajax({
	type : 'GET',
	url : 'notice/'+'내가 클릭한 공지사항 ID',
	success : function(response) {
		/*
		response는 List 형태로 날라옴
		NoticeVO의 모든 변수들의 내용이 response로 넘어온다.
		*/
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
/*/내가클릭한 공지사항의 상세내용  */

/* 공지사항 생성 */
var param={
		'pcode':$("#example").val(),
		'ntitle':$("#example").val(),
		'ncontents':$("#example").val(),
};
$.ajax({
	type : 'POST',
	url : 'notice',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		/*
		response는 1 or -1
		*/
		if(response==1){
			alert('공지사항 생성 완료')
		}
		else{
			alert('Server or Client ERROR, 공지사항 생성 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
/* /공지사항 생성  */

/* 공지사항 수정 */
var param={
		'ncode':$("#example").val(),
		'ntitle':$("#example").val(),
		'ncontents':$("#example").val(),
};
$.ajax({
	type : 'PUT',
	url : 'notice',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		/*
		response는 1 or -1
		*/
		if(response==1){
			alert('공지사항 수정 완료')
		}
		else{
			alert('Server or Client ERROR, 공지사항 수정 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
/* /공지사항 수정  */

/* 공지사항 삭제 */
$.ajax({
	type : 'DELETE',
	url : 'notice/'+'내가 클릭한 공지사항 ID',
	success : function(response) {
		/*
		response는 1 or -1
		*/
		if(response==1){
			alert('공지사항 삭제 완료')
		}
		else{
			alert('Server or Client ERROR, 공지사항 삭제 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
/* /공지사항 삭제  */

</script>
</html>