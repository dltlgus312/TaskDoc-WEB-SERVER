<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pc=request.getParameter("pcode");
	String pt=request.getParameter("ptitle");
	String pst=request.getParameter("psubtitle");
	String psd=request.getParameter("psdate");
	String ped=request.getParameter("pedate");
%>
<script type="text/javascript">
var id='<%=loginid%>';
if(id=="null"){
	alert('로그인이 필요한 페이지입니다.');
	window.location.href='/';
}
$("#ptitle").val('<%=pt%>');
$("#psubtitle").val('<%=pst%>');
$("#psdate").val('<%=psd%>');
$("#pedate").val('<%=ped%>');
</script>

</head>
<body>
	<div class="container">
		<h2>프로젝트 정보 수정</h2>
		<p>프로젝트 정보를 수정해보세요</p>

		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#home">프로젝트 관리</a></li>
			<li><a data-toggle="tab" href="#menu1">회원 관리</a></li>
			<li><a data-toggle="tab" href="#menu2">공지사항 관리</a></li>
			<li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
		</ul>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
					<div class="main"
						style="border: 1px solid rgba(0, 0, 0, 0.2); box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5); background-color: white; display: contents;">
						<div id="2" class="bts" style="width: 100%; margin-top: 10px;">
							<span>프로젝트 제목</span> <input id="ptitle"
								style="width: 80%; margin-top: 5px;" type="text"
								class="form-control">
						</div>
						<div id="3" class="bts" style="width: 100%;margin-top:30px;">
							<span>프로젝트 부제목</span> <input id="psubtitle"
								style="width: 80%; margin-top: 5px;" type="text"
								class="form-control">
						</div>
						<div id="4" class="bts" style="width: 100%;margin-top:30px;">
							<span>시작날짜</span> <input id="psdate"
								style="width: 80%; margin-top: 5px;" type="text"
								class="form-control">
						</div>
						<div id="5" class="bts" style="width: 100%;margin-top:30px;">
							<span>종료날짜</span> <input id="pedate"
								style="width: 80%; margin-top: 5px;" type="text"
								class="form-control">
						</div>
						<div id="7"
							style="width: 100%;margin-top:30px;">
							<div class="bts" style="height: 70%; margin-top: 16px;">
								<button type="button"
									style="margin-left: 7px; float: left; background-color: #ed8151; border: 0; outline: none;"
									class="btn btn-success" onclick="userdel()">프로젝트 삭제하기</button>
								<button type="button"
									style="float: right; margin-right: 7px; background-color: #ed8151; border: 0; outline: none;"
									class="btn btn-success" onclick="cancel()">Cancel</button>
								<button type="button" class="btn btn-success" onclick="edit()"
									style="margin: auto 0; margin-left: 6px; float: right; margin-right: 7px; background-color: #ed8151; border: 0; outline: none;">Edit</button>
							</div>
						</div>
					</div>

			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Menu 1</h3>
				<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h3>Menu 2</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			</div>
			<div id="menu3" class="tab-pane fade">
				<h3>Menu 3</h3>
				<p>Eaque ipsa quae ab illo inventore veritatis et quasi
					architecto beatae vitae dicta sunt explicabo.</p>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		if (location.hash) {
			$("a[href='" + location.hash + "']").tab("show");
		}
		$(document.body).on("click", "a[data-toggle]", function(event) {
			location.hash = this.getAttribute("href");
		});
	});
	$(window).on(
			"popstate",
			function() {
				var anchor = location.hash
						|| $("a[data-toggle='tab']").first().attr("href");
				$("a[href='" + anchor + "']").tab("show");
			});
</script>
</html>