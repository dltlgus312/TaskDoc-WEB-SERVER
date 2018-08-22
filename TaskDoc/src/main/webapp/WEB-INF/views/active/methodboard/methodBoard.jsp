<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/method/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode = request.getParameter("pcode");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
</script>

</head>

<body>
	<div class="container">
		<div style="margin-top: 20px;">
			<div style="float: left; display: -webkit-inline-box;">
				<input type="text" class="form-control" style="margin-right: 10px;">
				<a class="btn btn-success" onclick="wefw">검색</a>
			</div>

			<div style="float: right">
				<a href='/methodBoardCreate' class="btn btn-success">글쓰기</a>
				<button type="button" class="btn btn-success" onclick="test()">글쓰기테스트</button>
			</div>
		</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody id="tbodys">

			</tbody>
		</table>

	</div>
	<script type="text/javascript">
		//게시판 목록 전체 받아오기
		$(document).ready(function() {
			$.ajax({
				type : 'GET',
				url : '/methodboard/all',
				success : function(response) {
					if (response.length > 0) {
						alert('게시판 목록 전체 받아오기 성공! ' + response);
						for(var i=0;i<response.length;i++){
						var trtag = document.createElement("tr");
						
						var td_idx=document.createElement("td");
						var idxele=document.createTextNode(i+1);
						trtag.appendChild(td_idx);
						td_idx.appendChild(idxele);
						
						var td_title=document.createElement("td");
						//a tag의 onclick 이기때문에 손모양 css적용해주었음
						td_title.setAttribute('style','cursor:pointer')
						var a_title=document.createElement("a");
						//onclick 이벤트 적용해줌
						a_title.setAttribute('onclick','boardcon('+response[i].mbcode+')');
						var titleele=document.createTextNode(response[i].mbtitle);
						trtag.appendChild(td_title);
						a_title.appendChild(titleele);
						td_title.appendChild(a_title);
						
						var td_uid=document.createElement("td");
						var uidele=document.createTextNode(response[i].uid);
						trtag.appendChild(td_uid);
						td_uid.appendChild(uidele);
						
						 var td_date=document.createElement("td");
						var dateele=document.createTextNode(response[i].mbdate);
						trtag.appendChild(td_date);
						td_date.appendChild(dateele);  
						$("#tbodys").append(trtag);
						}
					} else {
						alert('Server or Client ERROR, 게시판 목록 전체 받아오기 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		});
		// 게시판 목록 전체 받아오기
		
		function test(){
			//게시글 작성하기
			var param = {
						'mbtitle' : '이것은테스트',
						'mbcontents' : '이것은테스트',
						'pcode' : 4,
						'uid' : '<%=loginid%>'
					};
					$.ajax({
						type : 'POST',
						url : '/methodboard',
						contentType : 'application/json',
						data : JSON.stringify(param),
						success : function(response) {
							if (response>0) {
								alert('게시판 생성 완료! 게시판의 mbcode값은' + response);
							} else{
								alert('Server or Client ERROR, 게시판 생성 실패');
							}
						},
						error : function(e) {
							alert("ERROR : " + e.statusText);
						}
					});
				//게시판 생성시 프로젝트 리스트 받아와서 프로젝트를 추가후 게시판 등록해야함
			//게시글 작성하기
		}
		function boardcon(code){
			location.href='/methodBoardView?mbcode='+code;
		}
	</script>
</body>
</html>