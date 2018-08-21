<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode = request.getParameter("pcode");
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
<script type="text/javascript">

//게시글 작성하기

var param = {
			'mbtitle' : $("#ptitle").val(),
			'mbcontents' : $("#psdate").val(),
			'pcode' : $("#pedate").val(),
			'uid' : '<%=loginid%>'
		};
		$.ajax({
			type : 'POST',
			url : '/methodboard',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response>0) {
					alert('게시판 생성 완료! 게시판의 mbcode값은' + response);
				} else{
					alert('Server or Client ERROR, 게시판 생성 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	//게시판 생성시 프로젝트 리스트 받아와서 프로젝트를 추가후 게시판 등록해야함
//게시글 작성하기

//게시판 글 상세보기
		$.ajax({
			type : 'GET',
			url : '/methodboard/'+'MBCODE',
			success : function(response) {
				if (Object.keys(response).length > 0) {
					alert('게시판 글 상세보기 완료! ' + response);
				} else{
					alert('Server or Client ERROR, 게시판 글 상세보기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
//게시판 글 상세보기

// 게시판 목록 전체 받아오기
$.ajax({
			type : 'GET',
			url : '/methodboard/all',
			success : function(response) {
				if (response.length > 0) {
					alert('게시판 목록 전체 받아오기 성공! ' + response);
				} else{
					alert('Server or Client ERROR, 게시판 목록 전체 받아오기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
// 게시판 목록 전체 받아오기

// 게시글 수정하기
var param = {
			'mbtitle' : '수정할 제목',
			'mbcontents' : '수정할 내용',
			'mbcode' : '수정할 게시글 코드',
		};
		$.ajax({
			type : 'PUT',
			url : '/methodboard',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response>0) {
					alert('게시판 수정 완료'  + response);
				} else{
					alert('Server or Client ERROR, 게시판 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
// 게시글 수정하기

//게시글 삭제하기
$.ajax({
			type : 'DELETE',
			url : '/methodboard/'+'MBCODE',
			success : function(response) {
				if (response > 0) {
					alert('게시글 삭제 완료! ' + response);
				} else{
					alert('Server or Client ERROR, 게시글 삭제 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
//게시글 삭제하기
	</script>
	 
</body>
</html>