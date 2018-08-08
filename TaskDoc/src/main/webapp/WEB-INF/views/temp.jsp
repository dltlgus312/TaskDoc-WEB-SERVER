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


<script type="text/javascript">
		function test() {
			
			var url = $("#url").val();
			var method = $("#method").val();
			var type = $("#type").val();
			var param = new Object;
			
			var user = {
				'uid' : document.getElementById("uid").value,
				'upasswd' : document.getElementById("upasswd").value,
				'uname' : document.getElementById("uname").value,
				'ustate' : document.getElementById("ustate").value,
				'uphone' : document.getElementById("uphone").value
			};
			var project = {
				'pcode' : document.getElementById("pcode").value,
				'ptitle' : document.getElementById("ptitle").value,
				'psubtitle' : document.getElementById("psubtitle").value,
				'psdate' : document.getElementById("psdate").value,
				'pedate' : document.getElementById("pedate").value
			};
			
			param = $.extend(true, project, user);

			if(type == 'json'){
				$.ajax({
					type : method,
					url : url,
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(param),
					success : function(response) {
						$("#bd").append(JSON.stringify(response));
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
						$("#bd").append(JSON.stringify(response));
					},
					error : function(e) {
						alert("ERROR : " + e.statusText);
					}
				});
			}
			$("#bd").append('<br>');
		}
	</script>
	
	
</head>
<body>

	<table>
		<thead>
			<tr><td><h3>HEAD</h3></td></tr>
			<tr><td><input type="text" id="url">URL</td>
			<td><input type="text" id="method">METHOD</td>
			<td><input type="text" id="type">TYPE</td>
			<td><button type="button" onclick="test()">SUBMIT</button>
			<button type="button" onclick="$('#bd').empty();">CLEAR</button></td></tr>
		</thead>
			<tr><td><h3>PROJECT</h3></td></tr>
		<tr>
			<td><input type="text" id="pcode" name="pcode">PCODE </td>
			<td><input type="text" id="ptitle" name="ptitle">TITLE</td>
			<td><input type="text" id="psubtitle" name="psubtitle">SUB</td>
			<td><input type="text" id="psdate" name="psdate">SDATE</td>
			<td><input type="text" id="pedate" name="pedate">EDATE</td>
		</tr>
				<tr><td><h3>USER</h3></td></tr>
		<tr>
			<td><input type="text" id="uid" name="uid">ID</td>
			<td><input type="text" id="upasswd" name="upasswd">PW</td>
			<td><input type="text" id="uname" name="uname">NAME</td>
			<td><input type="text" id="ustate" name="ustate">STATE</td>
			<td><input type="text" id="uphone" name="uphone">PHONE</td>
		</tr>
	</table>
	
	<div id="bd"></div>
</body>
</html>