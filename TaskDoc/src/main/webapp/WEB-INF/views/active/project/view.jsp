<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode=request.getParameter("pcode");
%>
<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
//pro_header.jsp , pro_header.js 에서 <script>태그 안에서 변수 사용가능하다.	
var pcode=<%=pcode%>;
$(function(){
$(".chat_hover").css('color','#ed8151').css('border-bottom','1px solid #ed8151');
$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
});
</script>

</head>
<body>
	<!--FRAME  -->
	<div id="frame">
		<!--MAIN HEADER  -->
		<%@include file="/WEB-INF/views/fix/main_header.jsp"%>
		<!--MAIN HEADER  -->

		<!--WRAPPER  -->
		<div id="wrapper">

			<!--SIDE BAR  -->
			<%@include file="/WEB-INF/views/fix/left_side.jsp"%>
			<!--SIDE BAR  -->

			<!--CONTENTWRAP  -->
			<div id="contentwrap" style="background-color: #e0e0e0;">
				<div class="container"
					style="background-color: white; overflow: auto;">

					<!-- PROJECT_FIX_HEADER  -->
					<%@include file="/WEB-INF/views/active/project/fix/pro_header.jsp"%>

					<!-- CHAT CONTENTS  -->
					<div  style="width: 100%; height: 93%;">
					<textarea id="tests" rows="20" cols="40"></textarea>
					<input id="chatcon" type="text">
					<button type="button" onclick="go()">전송.</button>
					</div>
				</div>

			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->

	</div>
	<!--FRAME  -->
</body>
<script>
/* $(function(){
        var text="abc";
        var text2="def";
        var socket = new SockJS('/goStomp');  //websocket이아닌 SockJS로 접속한다.
        stompClient = Stomp.over(socket); //stompClient에 socket을 넣어준다.
        stompClient.connect({}, function() { //접속
            stompClient.send('/app/in/tt', {}, JSON.stringify({'id':text, 'pw':text2}));
             
            stompClient.subscribe('/topic/in', function(msg) {
                alert(msg);
            });
        });
}); */
function go(){
	var con= $("#chatcon").val();
	$("#tests").append(id+" : "+con+'\n');
	$("#chatcon").val()=="";
}
</script>

</html>