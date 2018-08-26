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
	<div id="frame">
		<!--MAIN HEADER  -->
		<header>
			<nav class="header_nav">
				<div id="mainlogowrap">
					<img
						src="${pageContext.request.contextPath }/resources/img/img_taskdoclogo2.png" style="width:45px;height:45px;">
				</div>
				<div id="projectnamewrap">
					<a id="projectname" href="/project/main">TaskDoc</a>
				</div>
				
				<!--EDGE RIGHT MY ID SEE  -->
				<div class="dropdown" style="/* right:0px; position:absolute; */ height:50px;">
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
				
				<!--EDGE RIGHT MY ID SEE  -->

			</nav>
		</header>
		<!--MAIN HEADER  -->

		<div id="wrapper">
			<!--SIDE BAR  -->
			<aside id="sidebar">
				<div class="h-describe" data-toggle="tootlip"
				data-placement="right" title="프로젝트">
				<img id="describe" src="${pageContext.request.contextPath }/resources/img/img_describe.png">
				</div>
				<div class="h-task" data-toggle="tootlip"
				data-placement="right" title="개인 업무">
				<img id="task" src="${pageContext.request.contextPath }/resources/img/img_task.png">
				</div>
				<div class="h-user" data-toggle="tootlip"
				data-placement="right" title="나의 정보" >
				<img id="user" src="${pageContext.request.contextPath }/resources/img/img_user.png">
				</div>
				<div class="h-board" data-toggle="tootlip"
				data-placement="right" title="방법론 게시판">
				<img id="board" src="${pageContext.request.contextPath }/resources/img/img_board.png">
				</div>
				<div class="h-settings" data-toggle="tootlip"
				data-placement="right" title="설정">
				<img id="settings" src="${pageContext.request.contextPath }/resources/img/img_settings.png">
				</div>
				<div class="h-logout" data-toggle="tootlip"
				data-placement="right" title="로그아웃">
				<img id="logout" src="${pageContext.request.contextPath }/resources/img/img_logout.png" >
				</div>
			</aside>

			<!--SIDE BAR  -->
			<div id="contentwrap">
				
			</div>
		</div>
		<footer>
			<div id="footer">
			
			</div>
		</footer>
	</div>
</body>
	<!-- 
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
	form.submit(); -->   
	 
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