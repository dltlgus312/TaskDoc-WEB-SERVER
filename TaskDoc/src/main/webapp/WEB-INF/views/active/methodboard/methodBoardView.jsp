<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/method/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode = request.getParameter("pcode");
	String mbcode = request.getParameter("mbcode");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
</script>
</head>

<body>
	mbcode :
	<input type="text" id=mbcode readonly>
	<br /> mbcontents :
	<textarea  id="mbcontents" readonly></textarea>
	<br /> mbdate :
	<input type="text" id=mbdate readonly>
	<br /> mbtitle :
	<input type="text" id=mbtitle readonly>
	<br /> pcode :
	<input type="text" id=pcode readonly>
	<br /> uid :
	<input type="text" id=uid readonly>
	<br />

	<button type="button" onclick="edit()">수정하기</button>
	<button type="button" onclick="ok()" id="okbutton">등록하기</button>
	<button type="button" onclick="boarddel()">삭제하기</button>
	<button type="button" onclick="back()">돌아가기</button>
</body>
<script type="text/javascript">
$(document).ready(function() {
	//버튼 숨기기
	$("#okbutton").hide();
	
	//게시판 글 상세보기
	$.ajax({
		type : 'GET',
		url : '/methodboard/'+'<%=mbcode%>',
		success : function(response) {
			if (Object.keys(response).length > 0) {
				alert('게시판 글 상세보기 완료! ' + response);
				$("#mbcode").val(response.mbcode);
				$("#mbcontents").val(response.mbcontents);
				$("#mbdate").val(response.mbdate);
				$("#mbtitle").val(response.mbtitle);
				$("#pcode").val(response.pcode);
				$("#uid").val(response.uid);
			} else{
				alert('Server or Client ERROR, 게시판 글 상세보기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	//게시판 글 상세보기
});

function edit(){
	$('#mbcontents').attr("readOnly", false); 
	$('#mbtitle').attr("readOnly", false); 
	$("#okbutton").show();
}
function ok(){
	//게시글 수정하기
	var param = {
				'mbtitle' : $('#mbtitle').val(),
				'mbcontents' : $('#mbcontents').val(),
				'mbcode' : '<%=mbcode%>',
			};
			$.ajax({
				type : 'PUT',
				url : '/methodboard',
				contentType : 'application/json',
				data : JSON.stringify(param),
				success : function(response) {
					if (response>0) {
						alert('게시판 수정 완료'  + response);
						location.href='/methodBoard';
					} else{
						alert('Server or Client ERROR, 게시판 수정 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
	// 게시글 수정하기
}

function boarddel(){
	//게시글 삭제하기
	$.ajax({
				type : 'DELETE',
				url : '/methodboard/'+'<%=mbcode%>',
			success : function(response) {
				if (response > 0) {
					alert('게시글 삭제 완료! ' + response);
					location.href = '/methodBoard'
				} else {
					alert('Server or Client ERROR, 게시글 삭제 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		//게시글 삭제하기
	}

	function back() {
		location.href = '/methodBoard';
	}
</script>

</html>