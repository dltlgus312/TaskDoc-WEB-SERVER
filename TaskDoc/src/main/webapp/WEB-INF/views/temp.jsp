<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- ${path} == (localhost:8080/test) --%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/www/user/userinfo" method="POST">
		<input type="text" name="uid"> <input type="text" name="upasswd">
		<input type="text" name="uname"> <input type="text" name="ustate">
		<input type="text" name="uphone">
		<input type="submit" value="but">
	</form>
	<!-- <button type="button" onclick="test()"></button> -->
	<!-- <script type="text/javascript">
		function test() {
			var param = {
				'uid' : document.getElementById("uid").value,
				'upasswd' : document.getElementById("upasswd").value,
				'uname' : document.getElementById("uname").value,
				'ustate' : document.getElementById("ustate").value,
				'uphone' : document.getElementById("uphone").value
			};
			$.ajax({
				type : 'POST',
				url : '/www/user/userinfo',
				data : JSON.stringify(param),
				success : function(response) {
					alert("CONTROLLER RETURN VALUE : " + response);
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		}
	</script>   -->
</body>
</html>