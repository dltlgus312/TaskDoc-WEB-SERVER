<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
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
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
							<div>
								<label style="padding-top: 6px">의사결정 문항</label>
								<div id="tableDiv" style="display: none;">
									<table class="table">
										<!--Table head-->
										<thead id="thead">
											<tr>
												<th>번호</th>
												<th>문항</th>
												<th>체크</th>
												<th>COUNT</th>
											</tr>
										</thead>
									</table>
								</div>

							</div>
							<h4 class="endhaha" style="color: red"></h4>
							<div></div>

						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="isEmpty">
						<button type="button" class="btn btn-default btn-icon"
							onclick="decisionEnd()" id="Endbtn">
							<i class="fa fa-times-circle"></i> 종료
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="choiceDecision()" id="Okbtn">
							<i class="fa fa-times-circle"></i> 선택하기
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="proCancel()">
							<i class="fa fa-times-circle"></i> Cancel
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var decisionitemlist = [];

	$(document).ready(function() {
		/* 의사결정의 항목 조회*/
		$.ajax({
			type : 'GET',
			url : '/decisionitem/' + 16,
			success : function(response) {
				if (response.length > 0) {
					alert('의사결정 항목 조회 완료! ' + response);
					for (var i = 0; i < response.length; i++) {
						decisionitemlist.push(response[i].dsilist);
					}
					alert(decisionitemlist);
				} else {
					alert('Server or Client ERROR, 의사결정 항목 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	});
	/*  /의사결정의 항목 조회*/
</script>
</html>