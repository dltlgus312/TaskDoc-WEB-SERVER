<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- BOOTSTRAP CSS, JS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- BOOTSTRAP CSS, JS -->

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
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

	<div class="container">
		<div class="row">
			<div class="modal-content" style="width: 800px; margin: auto;">
				<div class="modal-header">
					<h4 class="modal-title">글 상세보기</h4>
				</div>
				<div class="modal-body">
					<div>
						<label >게시 코드 : </label>
						<label id="mbcode"> </label>
					</div>
					<div>
						<label >프로젝트코코드 : </label>
						<label id="pcode"> </label>
					</div>
					<div>
						<label>게시 시간 : </label>
						<label id="mbdate"> </label>
					</div>
					<div>
						<label>작성자 : </label>
						<label id="uid"></label>
					</div>
					<!--제목 , 내용 div  -->
					<div class="form-group">
						<label>제목</label> <input id="mbtitle" type="text"
							class="form-control" maxlength="20"> <label
							style="padding-top: 5px;">내용</label>
						<textarea class="form-control" rows="8" id="mbcontents"></textarea>
					</div>
					<!--제목 , 내용 div  -->

					<!-- button div  -->
					<div>
						<button type="button" class="btn btn-default btn-icon"
							onclick="promethodInfo()">
							<i class="fa fa-times-circle"></i> 프로젝트의 방법론보기
						</button>
					</div>
					
					<div class="modal-footer" style="margin-bottom:30px;">
					<button type="button" class="btn btn-success btn-icon"
							onclick="boardEdit()">
							<i class="fa fa-check"></i> Edit
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="boardEditCancel()">
							<i class="fa fa-times-circle"></i> Back
						</button>
					</div>
					<!-- button div  -->

				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var pcode;
$(document).ready(function() {
	//버튼 숨기기
	$("#okbutton").hide();
	
	//게시판 글 상세보기
	$.ajax({
		type : 'GET',
		url : '/methodboard/'+'<%=mbcode%>',
		success : function(response) {
			if (Object.keys(response).length > 0) {
				pcode=response.pcode;
				alert('게시판 글 상세보기 완료! ' + response);
				$("#mbcode").text(response.mbcode);
				$("#mbcontents").val(response.mbcontents);
				$("#mbdate").text(response.mbdate);
				$("#mbtitle").val(response.mbtitle);
				$("#pcode").text(response.pcode);
				$("#uid").text(response.uid);
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

function boardEdit(){
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
				if (response > 0) {
					alert('게시판 수정 완료' + response);
					location.href = '/methodBoard';
				} else {
					alert('Server or Client ERROR, 게시판 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		// 게시글 수정하기
	}
	
	//돌아가기
	function boardEditCancel() {
		location.href = '/methodBoard';
	}
	
	//프로젝트의 방법론보기
	function promethodInfo(){
		
	}	

</script>

</html>