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

	<table>
		<thead>
			<tr><td><input type="text" id="url"> Url</td>
			<td><input type="text" id="method"> Method</td></tr>
			<td><input type="text" id="type"> Type</td></tr>
		</thead>
		<tr>
			<td><input type="text" id="pcode" name="pcode"> code </td>
			<td><input type="text" id="ptitle" name="ptitle"> title</td>
			<td><input type="text" id="psubtitle" name="psubtitle"> sub</td>
			<td><input type="text" id="psdate" name="psdate"> sdate</td>
			<td><input type="text" id="pedate" name="pedate"> edate</td>
		</tr>
		<tr>
			<td><input type="text" id="uid" name="uid"> id</td>
			<td><input type="text" id="upasswd" name="upasswd"> pw</td>
			<td><input type="text" id="uname" name="uname"> name</td>
			<td><input type="text" id="ustate" name="ustate"> state</td>
			<td><input type="text" id="uphone" name="uphone"> phone</td>
		</tr>
	</table>

	<button type="button" onclick="test()">전송</button>
	<script type="text/javascript">
		function test() {
			var param = {
				'uid' : document.getElementById("uid").value,
				'upasswd' : document.getElementById("upasswd").value,
				'uname' : document.getElementById("uname").value,
				'ustate' : document.getElementById("ustate").value,
				'uphone' : document.getElementById("uphone").value,
				'pcode' : document.getElementById("pcode").value,
				'ptitle' : document.getElementById("ptitle").value,
				'psubtitle' : document.getElementById("psubtitle").value,
				'psdate' : document.getElementById("psdate").value,
				'pedate' : document.getElementById("pedate").value
			};
			if($("#type").val() == 1){
				$.ajax({
					type : $("#method").val(),
					url : $("#url").val(),
					data : param,
					success : function(response) {
						alert("CONTROLLER RETURN VALUE : " + response);
					},
					error : function(e) {
						alert("ERROR : " + e.statusText);
					}
				});
			}else{
				$.ajax({
					type : $("#method").val(),
					url : $("#url").val(),
					data : param,
					success : function(response) {
						alert("CONTROLLER RETURN VALUE : " + response);
					},
					error : function(e) {
						alert("ERROR : " + e.statusText);
					}
				});
			}
		}
	</script>
</body>
</html>