<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="../../favicon.ico">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Jquery -->
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath }/resources/css/user/login.css"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="${pageContext.request.contextPath }/resources/css/bootstrap/js/ie-emulation-modes-warning.js"></script>
</head>

<body>

	<div class="container">

		<form class="form-signin">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input type="text" id="inputId" class="form-control" placeholder="ID"
				required autofocus> <input type="password" id="upasswd"
				class="form-control" placeholder="PASSWD">
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				id="sign">Sign in</button>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				id="goMain">Cancel</button>
		</form>
	</div>
</body>
<script type="text/javascript">
	var testHost = 'http://localhost:8080/';
	var serverHost = '';
	$(function() {

		/*Cancel시 Main으로*/
		$("#goMain").click(function() {
			location.href = testHost + 'www';
		});
		/*/Cancel시 Main으로*/

		/*Login 처리*/
		$("#sign").click(
				function() {
					$.ajax({
						type : 'GET',
						url : '/www/userinfo/' + uid,
						success : function(response) {
							/* REST 처리*/
						},
						error : function(e) {
							alert("ERROR : " + e.statusText);
						}
					});

				});
		/* /Login 처리*/
		
	});
</script>
</html>
