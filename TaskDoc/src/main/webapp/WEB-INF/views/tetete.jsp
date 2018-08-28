<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sidebar/menu/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sidebar/menu/slinky.min.css">
</head>

<body>
	<h2>Demo</h2>
	<div id="menu">
		<ul>
			<li><a href="https://designplox.com/">designplox</a></li>
			<li><a href="#">Artists</a></li>
			<li><a href="#">Albums</a></li>
			<li><a href="#">Songs</a></li>
			<li><a href="#">Genres</a></li>aaaa
			<li><a href="#">Settings</a></li>
		</ul>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/sidebar/menu/slinky.min.js"></script>
	<script>
		const slinky = $('#menu').slinky()
	</script>
	
		
	
	<form action="/document/upload" enctype="multipart/form-data" method="POST">
		<input name="dmtitle" value="test"/>
		<input name="dmcontents" value="testtest"/>
		<input name="crcode" value="1"/>
		<input name="tcode" value="12"/>
		<input name="uid" value="d"/>
		
		<input type="file" name="file"/>
		<input type="file" name="file"/>
		<input type="file" name="file"/>
		<input type="file" name="file"/>

		<input type="submit">
	</form>
	
		
	<form action="/document/download/6" method="POST">
		<input type="submit" value="다운로드">
	</form>
		
	
	
</body>
</html>