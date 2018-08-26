<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
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
	<div id="frame"
		style="width: 100%; height: 100%; margin: 0px; position: absolute; top: 0; left: 0; overflow: hidden;">

		<!--MAIN HEADER  -->
		<header id="main_header">
			<!-- main_header.jsp 탑 메뉴 고정   -->
			<nav
				style="width: 100%; height: 50px; background-color: #333; display: inline-flex;">
				<!--이미지중앙정렬 text-align  -->
				<div
					style="width: 76.8px; height: 50px; text-align: center; background-color: white">
					<img
						src="${pageContext.request.contextPath }/resources/img/img_taskdoclogo.png">
				</div>
				<div
					style="width: 100px; background-color: #ed8151; text-align: center;">
					<!--line-height : element 요소의 세로크기만큼 지정해주면 세로로 중앙정렬이됨  -->
					<a class="active" href="/project/main"
						style="color: white; font-size: 20px; line-height: 50px; text-decoration: none;">TaskDoc</a>
				</div>
				<div class="dropdown" style="right:0px; position:absolute; height:50px;">
					<button class="btn btn-default dropdown-toggle" type="button"
						data-toggle="dropdown"
						style="color: white; background-color: #333; border-color: #333; width: 100%; height: 100%; font-size:17px;">
						<%=loginid%> <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">나의 정보</a></li>
						<li><a href="/user/logout">로그아웃</a></li>
					</ul>
				</div>

			</nav>
		</header>
		<!--MAIN HEADER  -->

		<div id="wrapper" style="width: 100%; height: calc(100% - 100px);">

			<!--SIDE BAR  -->
			<aside id="sidebar"
				style="background-color: white; width: 50px; height: 100%; float: left;">
				
				<div class="h-describe" data-toggle="tootlip"
				data-placement="right" title="프로젝트" style="width:100%;height:70px;background-color: white; text-align: center; line-height:70px;">
				<img id="describe" src="${pageContext.request.contextPath }/resources/img/img_describe.png" style="width:25px;height:25px;">
				</div>
				<div class="h-task" data-toggle="tootlip"
				data-placement="right" title="개인 업무" style="width:100%;height:70px;background-color: white; text-align: center; line-height:70px;">
				<img id="task" src="${pageContext.request.contextPath }/resources/img/img_task.png" style="width:25px;height:25px;">
				</div>
				<div class="sidebar-button" data-toggle="tootlip"
				data-placement="right" title="나의 정보" style="width:100%;height:70px;background-color: white; text-align: center; line-height:70px;">
				<img id="user" src="${pageContext.request.contextPath }/resources/img/img_user.png" style="width:25px;height:25px;">
				</div>
				<div class="sidebar-button" data-toggle="tootlip"
				data-placement="right" title="방법론 게시판" style="width:100%;height:70px;background-color: white; text-align: center; line-height:70px;">
				<img id="board" src="${pageContext.request.contextPath }/resources/img/img_board.png" style="width:25px;height:25px;">
				</div>
				<div class="sidebar-button" data-toggle="tootlip"
				data-placement="right" title="설정" style="width:100%;height:70px;background-color: white; text-align: center; line-height:70px;">
				<img id="settings" src="${pageContext.request.contextPath }/resources/img/img_settings.png" style="width:25px;height:25px;">
				</div>
				<div class="sidebar-button" data-toggle="tootlip"
				data-placement="right" title="로그아웃" style="width:100%;height:70px;background-color: white; text-align: center; line-height:70px;">
				<img id="logout" src="${pageContext.request.contextPath }/resources/img/img_logout.png" style="width:25px;height:25px;">
				</div>
			</aside>

			<!--SIDE BAR  -->

			<div id="contentwrap"
				style="width: calc(100% - 50px); height: 100%; float: left; overflow: auto;">
				
			</div>
		</div>
		<footer style="width: 100%; height: 50px; background-color: black;"></footer>
	</div>
</body>

<script type="text/javascript">
	/*TOOLTIP JS  */
	$(document).ready(function() {
		$('[data-toggle="tootlip"]').tooltip();
		$(".h-describe").hover(function(){
	        $(this).css("background-color", "#ed8151");
	        $("#describe").attr("src","${pageContext.request.contextPath }/resources/img/hover_describe.png");
	        }, function(){
		    $(this).css("background-color", "white");
		    $("#describe").attr("src","${pageContext.request.contextPath }/resources/img/img_describe.png");
	    });
		$(".h-task").hover(function(){
	        $(this).css("background-color", "#ed8151");
	        $("#task").attr("src","${pageContext.request.contextPath }/resources/img/hover_task.png");
	        }, function(){
		    $(this).css("background-color", "white");
		    $("#task").attr("src","${pageContext.request.contextPath }/resources/img/img_task.png");
	    });
	});

	/* 
	//window.open post방식으로 값넘기기
	var form = document.createElement("form");      // form 엘리멘트 생성
	form.setAttribute("method","post");             // method 속성 설정
	form.setAttribute("action","/project/create");       // action 속성 설정
	document.body.appendChild(form);                // 현재 페이지에 form 엘리멘트 추가
	
	var insert = document.createElement("input");   // input 엘리멘트 생성
	insert.setAttribute("type","hidden");           // type 속성을 hidden으로 설정
	insert.setAttribute("name","ids");               // name 속성을 'stadium'으로 설정
	insert.setAttribute("value","ddddzz");             // value 속성을 삽입
	form.appendChild(insert);                       // form 엘리멘트에 input 엘리멘트 추가
	form.submit();   
	 */
</script>
<!-- 
<script type="text/javascript">
	/* 내가 참가하는 모든 프로젝트를 검색*/
	$.ajax({
		type : 'GET',
		url : 'projectjoin/' + '현재 접속한 ID',
		success : function(response) {
			/*
			response는 map 형태로 날라옴
			프로젝트 결과 값 = map ( KEY = "projectList", "projectJoinList" )
			프로젝트에 소속되어있는 정보들
			projectJoinList{
				pcode;
			 	uid;
			 	ppermission;
			 	pinvite;
			}
			프로젝트들의 정보
			projectList{
				pcode;
				ptitle;
				psubtitle;
				psdate;
				pedate;	
			}
			pcode별로 프로젝트 list 나열하고, 프로젝트별 title, subtitle, psdate, pedate 설정하기
			 */
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});

	/* /내가 참가하는 모든 프로젝트를 검색*/
	/* 프로젝트에 초대받은사람 수락할때  
	 * projectjoin_SQL 다시알아보기★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	 */
	var param = {
		'pcode' : '현재 PCODE',
		'uid' : '현재 수락할 ID',
		'ppermission' : 'MEMBER',
		'pinvite' : 1
	};
	$.ajax({
		type : 'PUT',
		url : 'projectjoin',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('초대 수락 완료!');
			} else {
				alert('Server or Client ERROR, 초대 수락  실패!');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/프로젝트에 초대받은사람 수락할때 */
</script>

 -->
</html>