<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--HTML5임을 명시  -->
<!DOCTYPE html>
<html>
<head>
<!--HTML charset 명시  -->
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/method/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<!-- header.jsp css,js include할것   -->
<%@include file="/WEB-INF/views/fix/header.jsp"%>
</head>

<body>
	<div id="frame"
		style="width: 100%; height: 100%; margin: 0px; position: absolute; top: 0; left: 0; overflow:hidden;">

		<div id="main_header">
			<!-- main_header.jsp 탑 메뉴 고정   -->
			<nav style="background-color: red; width: 100%; height: 50px;"></nav>
		</div>

		<div id="wrapper" style="width: 100%; height: calc(100% - 100px);">
			<div id="sidebar"
				style="background-color: yellow; width: 10%; height: 100%; float: left;">
			</div>
			<div id="contentwrap"
				style=" width: 90%; height: 100%; float: left; overflow:auto;">
				
				<!--test  -->
				<div class="container">
					<div style="margin-top: 20px;">
						<div style="float: left; display: -webkit-inline-box;">
							<input type="text" class="form-control"
								style="margin-right: 10px;"> <a class="btn btn-success"
								onclick="wefw">검색</a>
						</div>

						<div style="float: right">
							<a href='/methodBoardCreate' class="btn btn-success">글쓰기</a>
						</div>
					</div>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">번호</th>
								<th style="width: 400px;">제목</th>
								<th style="width: 150px;">작성자</th>
								<th style="width: 200px;">날짜</th>
								<th style="width: 100px;">관리</th>
							</tr>
						</thead>
						<tbody id="tbodys">

						</tbody>
					</table>
				</div>
				<!--test  -->
			</div>

		</div>
		<div style="width: 100%; height: 50px; background-color: black;"></div>
	</div>
</body>
</html>