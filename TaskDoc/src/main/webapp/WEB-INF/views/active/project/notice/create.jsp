<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pc=request.getParameter("pcode");
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
	<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title">공지사항을 게시해주세요</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>공지사항 제목</label> <input id="noticetitle" type="text"
							class="form-control" maxlength="20"> <label
							style="padding-top: 5px;">공지사항 내용</label> <textarea id="noticecontents"
							class="form-control" style="height:100px;"></textarea>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="isEmpty">
						<button type="button" class="btn btn-success btn-icon"
							onclick="noticeCreate()">
							<i class="fa fa-check"></i> Create Notice
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="noticeCancel()">
							<i class="fa fa-times-circle"></i> Cancel
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
function noticeCreate(){
	/* 공지사항 생성 */
	var param={
			'pcode': '<%=pc%>',
			'ntitle':$("#noticetitle").val(),
			'ncontents':$("#noticecontents").val(),
	};
	$.ajax({
		type : 'POST',
		url : '/notice',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			/*
			response는 1 or -1
			*/
			if(response>0){
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
}

function noticeCancel(){
	window.close();
}
</script>

</html>