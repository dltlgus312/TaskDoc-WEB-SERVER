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
<<<<<<< HEAD
</head>
<body>
<<<<<<< HEAD
	<form action="/www/user/userinfo" method="POST">
		<input type="text" name="uid"> <input type="text" name="upasswd">
		<input type="text" name="uname"> <input type="text" name="ustate">
		<input type="text" name="uphone">
		<input type="submit" value="but">
	</form>
	<!-- <button type="button" onclick="test()"></button> -->
	<!-- <script type="text/javascript">
=======
=======
>>>>>>> refs/heads/sql_sihyeon


<<<<<<< HEAD
	<input type="text" id="ptitle" name="ptitle"> title
	<input type="text" id="psubtitle" name="psubtitle"> sub
	<input type="text" id="psdate" name="psdate"> sdate
	<input type="text" id="pedate" name="pedate"> edate


	<input type="text" id="uid" name="uid"> id
	<input type="text" id="upasswd" name="upasswd"> pw
	<input type="text" id="uname" name="uname">	name
	<input type="text" id="ustate" name="ustate"> state
	<input type="text" id="uphone" name="uphone"> phone


	<button type="button" onclick="test()"></button>
	<script type="text/javascript">
>>>>>>> branch 'SQL_DTO' of https://github.com/dltlgus312/TaskDoc.git
=======
<script type="text/javascript">
>>>>>>> refs/heads/sql_sihyeon
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
<<<<<<< HEAD
			$.ajax({
				type : 'POST',
<<<<<<< HEAD
				url : '/www/user/userinfo',
=======
				url : '/project/',
				contentType : "application/json; charset=utf-8",
>>>>>>> branch 'SQL_DTO' of https://github.com/dltlgus312/TaskDoc.git
				data : JSON.stringify(param),
				success : function(response) {
					alert("CONTROLLER RETURN VALUE : " + response);
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
=======
			
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
>>>>>>> refs/heads/sql_sihyeon
		}
<<<<<<< HEAD
	</script>   -->
=======
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
>>>>>>> refs/heads/sql_sihyeon
</body>
</html>