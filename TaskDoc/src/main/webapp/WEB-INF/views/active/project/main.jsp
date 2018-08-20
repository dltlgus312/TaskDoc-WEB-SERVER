<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
String loginid="";
loginid=(String)session.getAttribute("loginid");
%>
<script type="text/javascript">
var id='<%=loginid%>';
if(id=="null"){
	alert('로그인이 필요한 페이지입니다.');
	window.location.href='/';
}
</script>
</head>
<jsp:include page="/WEB-INF/views/fix/sidebar.jsp" flush="false">
	<jsp:param value="<%=loginid%>" name="loginid"/>
</jsp:include>
<body style="display: -webkit-inline-box; overflow-x: hidden;">
	<div style="display: -webkit-inline-box; width: 1500px; height: 100%;">
		<button id="project_create">프로젝트생성</button>
		<button id="project_userinvite">프로젝트유저초대</button>
		<div style="width: 300px; height: 300px; background-color: red"></div>
		<div style="width: 300px; height: 300px; background-color: black"></div>
		<div style="width: 300px; height: 300px; background-color: blue"></div>
		<div style="width: 300px; height: 300px; background-color: yellow"></div>
		<div style="width: 300px; height: 300px; background-color: green"></div>
		<div style="width: 300px; height: 300px; background-color: red"></div>

	</div>
</body>
<script type="text/javascript">
var popupX = (window.screen.width / 2) - (500 / 2);
var popupY= (window.screen.height /2) - (400 / 2);

$("#project_create").click(function(){
	 window.open("/project/create?id="+"a","", "height=400, width=500, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY); 
});

$("#project_userinvite").click(function(){
	 window.open("/project/userInvite?pcode="+"1","", "height=400, width=500, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY); 
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