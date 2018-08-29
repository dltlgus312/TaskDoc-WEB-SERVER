var id='<%=loginid%>';

//로그인 아이디 앞에 'ID' 를 붙임
$(document).ready(function() {
	$("#buttonloginid").html('ID : '+id);
});

//새 프로젝트 클릭, 새 업무 클릭시  WINDOW 창 생성
$(function() {
	$("#newproject").click(function() {
		window.open("/project/create","", "height=400, width=600, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY); 
	});
	
	$("#newtask").click(function() {
		location.href = '/privatetask/create';
	});
});