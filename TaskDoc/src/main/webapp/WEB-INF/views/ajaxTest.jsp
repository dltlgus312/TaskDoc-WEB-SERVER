<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
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

<!--TaskDocMain css -> For button use  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/normalize.css?ver=42" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taskdocMain/demo.css?ver=42" />
<!--/TaskDocMain css -> For button use  -->
</head>

<body>
	<button onclick="ajaxTest()"></button>
</body>
<script type="text/javascript">
	function ajaxTest() {
		/*공용 업무 생성 */
		var param = {
			'ttitle' :'publicTASK 1',
			'tcolor' : 'RED',
			'tsdate' :'20180606',
			'tedate' : '20180707',
			 /* 'trefference' : '11',  */
			'pcode' :'5'
		};
		$.ajax({
			type : 'POST',
			url : '/www/publictask',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response != -1) {
					alert('공용업무 생성 완료! 프로젝트의 공용업무의 id값은' + response);
				} else if (response == -1) {
					alert('Server or Client ERROR, 공용업무 생성 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}
		/*/공용 업무 생성 */
</script>

</html>
