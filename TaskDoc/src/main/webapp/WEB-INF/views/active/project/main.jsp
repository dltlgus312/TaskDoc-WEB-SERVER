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

		<header id="main_header">
			<!-- main_header.jsp 탑 메뉴 고정   -->
			<nav style="background-color: red; width: 100%; height: 50px;">TaskDoc
				프로젝트 통합 관리 시스템</nav>
		</header>

		<div id="wrapper" style="width: 100%; height: calc(100% - 100px);">

			<aside id="sidebar"
				style="background-color: yellow; width: 5%; height: 100%; float: left;">
				<ul style="list-style: none; padding-left: 25px;">
					<li data-toggle="tootlip" data-placement="right" title="프로젝트"
						style="margin-top: 40px;"><a href="/project/main"> <img
							src="${pageContext.request.contextPath }/resources/img/img_describe.png"
							style="width: 25px;">
					</a></li>

					<li data-toggle="tootlip" data-placement="right" title="개인업무"
						style="margin-top: 40px;"><a href="#"> <img
							src="${pageContext.request.contextPath }/resources/img/img_task.png"
							style="width: 25px;">
					</a></li>

					<li data-toggle="tootlip" data-placement="right" title="내정보"
						style="margin-top: 40px;"><a href="/user/infoEdit?id=a">
							<img
							src="${pageContext.request.contextPath }/resources/img/img_user.png"
							style="width: 25px;">

					</a></li>
					<li data-toggle="tootlip" data-placement="right" title="방법론게시판"
						style="margin-top: 40px;"><a href="/methodBoard"> <img
							src="${pageContext.request.contextPath }/resources/img/img_board.png"
							style="width: 25px;">
					</a></li>
					<li data-toggle="tootlip" data-placement="right" title="설정"
						style="margin-top: 40px;"><a href="#"> <img
							src="${pageContext.request.contextPath }/resources/img/img_settings.png"
							style="width: 25px;">
					</a></li>

					<li data-toggle=tootlip data-placement="right" title="로그아웃"
						style="margin-top: 40px;"><a href="/user/logout"> <img
							src="${pageContext.request.contextPath }/resources/img/img_logout.png"
							style="width: 25px;">
					</a></li>
				</ul>
			</aside>

			<div id="contentwrap"
				style="width: 95%; height: 100%; float: left; overflow: auto;">
			<button type="button">프로젝트 생성~</button>
			</div>

		</div>
		<footer style="width: 100%; height: 50px; background-color: black;"></footer>
	</div>
</body>

<script type="text/javascript">
	/*TOOLTIP JS  */
	$(document).ready(function() {
		$('[data-toggle="tootlip"]').tooltip();
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