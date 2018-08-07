<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- ${path} == (localhost:8080/test) --%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <input type="text" id="uid" >
	<input type="text" id="upasswd" >
	<input type="text" id="uname" >
	<input type="text" id="ustate" >
	<input type="text" id="uphone" >
	
	<button type="button" onclick="test()"></button>
	<script type="text/javascript">
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
				url : 'http://172.26.1.148:8080/userinfo',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(param),
				success : function(response) {
					alert("CONTROLLER RETURN VALUE : " + response);
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		}
	</script>  
</body>
</html>