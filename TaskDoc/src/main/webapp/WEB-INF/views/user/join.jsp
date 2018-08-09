<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<link href="${pageContext.request.contextPath }/resources/css/join.css" />
</head>
<body>
	<div>
		<div class="container" style="width: 600px; margin-top: 30px;">
			<div class="row">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title">회원가입을 환영합니다!</h4>
					</div>
					<div class="modal-body">

						<!-- 아이디 입력 -->
						<div class="form-group">
							<label>아이디</label>
							<div style="display: -webkit-box;">
								<input id="uid" style="width: 80%;" type="text"
									class="form-control">
								<button type="button" id="userDuplicate"
									class="btn btn-default btn-icon" style="margin-left: 6px;">
									<i class="fa fa-times-circle"></i> 중복확인
								</button>
							</div>
							<span class="help-block">아이디는 로그인 하는데 사용됩니다.</span>
						</div>
						<!-- /아이디 입력 -->

						<!-- 비밀번호 입력 -->
						<div class="form-group">
							<label>비밀번호</label> <input id="upasswd" style="width: 80%;"
								type="password" class="form-control"><span
								class="help-block">비밀번호를 입력해주세요.</span>
						</div>
						<!-- /비밀번호 입력 -->

						<!-- 이름 입력 -->
						<div class="form-group">
							<label>이름</label> <input id="uname" style="width: 80%;"
								type="text" class="form-control"> <span
								class="help-block">이름을 입력해주세요.</span>
						</div>
						<!-- /이름 입력 -->

						<div class="form-group">
							<label>상태메시지</label> <input id="ustate" style="width: 80%;"
								type="text" class="form-control"> <span
								class="help-block">상태메시지를 입력해주세요.</span>
						</div>

						<!-- 휴대폰 번호입력 -->
						<div class="form-group">
							<label for="uphone">휴대폰 번호</label> <input id="uphone"
								style="width: 80%;" type="text" class="form-control"
								name="userEmail" value=""> <span class="help-block">휴대폰
								번호(' - '는 빼주세요)를 입력 해주세요.</span>
						</div>
						<!-- /휴대폰 번호입력 -->
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success btn-icon"
							id="userJoin">
							<i class="fa fa-check"></i> Create My Account
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="goMain()">
							<i class="fa fa-times-circle"></i> Cancel
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var testHost = 'http://localhost:8080/';
	var serverHost = '';
	/*Cancel시 Main으로*/
	function goMain() {
		location.href = testHost + 'www';
	}

	$(function() {
		//아이디 중복검사를할 플래그
		var jbFlag = true;

		/*중복 검사*/
		$("#userDuplicate").click(
				function() {
					var uid = $('#uid').val();
					if (uid == "") {
						alert('아이디를 입력해주시길 바랍니다.');
					} else {
						$.ajax({
							type : 'GET',
							url : '/www/userinfo/' + uid,
							success : function(response) {
								if (uid == response.uid) {
									alert('중복된 아이디입니다.');
								} else {
									if (confirm("이 아이디를 선택하시겠습니까?")) {
										jbFlag = false;
										$("#uid").attr("readonly", true).attr(
												"disabled", false);
										$("#userDuplicate").attr("readonly",
												false).attr("disabled", true);
									} else {
										return;
									}
								}
							},
							error : function(e) {
								alert("ERROR : " + e.statusText);
							}
						});
					}
				});
		/* /중복 검사 */

		/*회원가입 처리  */
		$("#userJoin").click(function() {
			var uid = $('#uid').val();
			var param = {
				'uid' : $('#uid').val(),
				'upasswd' : $('#upasswd').val(),
				'uname' : $('#uname').val(),
				'ustate' : $('#ustate').val(),
				'uphone' : $('#uphone').val(),
			};
			if (jbFlag == true) {
				alert('아이디 중복검사를 해주세요');
			} else {
				$.ajax({
					type : 'POST',
					url : '/www/userinfo/',
					contentType : 'application/json',
					data : JSON.stringify(param),
					success : function(response) {
						alert('회원가입이 완료되었습니다!');
						goMain();
					},
					error : function(e) {
						alert("ERROR : " + e.statusText);
					}
				});
			}
		});
		/* /회원가입 처리  */
	});
</script>
</html>
