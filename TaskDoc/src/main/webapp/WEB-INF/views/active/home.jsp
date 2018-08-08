<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ${path} == (localhost:8080/test) --%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@include file="/WEB-INF/views/fix/header.jsp"%>

</head>

<body>

	<!-- <input type="text" id="ptitle" name="ptitle"> ptitle <br>
	<input type="text" id="psubtitle" name="psubtitle"> psubtitle <br>
	<input type="text" id="psdate" name="psdate"> psdate <br>
	<input type="text" id="pedate" name="pedate"> pedate <br>
	<input type="text" id="uid" name="uid"> uid <br>
	<input type="text" id="upasswd" name="upasswd"> upasswd <br>
	<input type="text" id="uname" name="uname"> uname <br>
	<input type="text" id="ustate" name="ustate"> ustate <br>
	<input type="text" id="uphone" name="uphone"> uphone <br> -->
	<input type="text" id="uid" name="uphone"> uphone <br> 
	document.gete
	<button type="button" onclick="test()"></button>
	<script type="text/javascript">
		function test() {
			$.ajax({
				type : 'GET',
				url : '/www/user/'+document.getElementById("uid").value,
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
<footer>

</footer>
</html>