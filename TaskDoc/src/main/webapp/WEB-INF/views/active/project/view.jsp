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
	String ptitle=request.getParameter("ptitle");
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
				<div class="container" style="background-color: white;">
					<div id="proheader" style="display:-webkit-box; width:100%;">
						<div id="proheadername" style="width:25%; border-bottom:1px solid #ddd">
							<a style="color:black;"><%=ptitle %>awefwefewfaewwefewfwe</a>
						</div>
						
						<div id="proheaderli" style="width:50%;">				
							<ul class="nav nav-tabs" style="text-align:center;">
								<li style="float:none;display:inline-block;zoom:1;"><a data-toggle="tab" href="#chat" style="color: #ed8151">채팅</a></li>
								<li style="float:none;display:inline-block;zoom:1;"><a data-toggle="tab" href="#ptask"style="color: #ed8151">공용 업무</a></li>
								<li style="float:none;display:inline-block;zoom:1;"><a data-toggle="tab" href="#gantt"style="color: #ed8151">간트차트</a></li>
								<li style="float:none;display:inline-block;zoom:1;"><a data-toggle="tab" href="#files"style="color: #ed8151">파일 모아보기</a></li>
							</ul>
						</div>
						
						<div id="proheaderbtn" style="width:25%;border-bottom:1px solid #ddd;">
							<button id="prochatbtn1" type="button" style="height:42px;color: #ed8151;float:right;outline: none;border:0;background-color:white;">설정</button>
							<button id="prochatbtn2" type="button" style="height:42px;color: #ed8151;float:right;outline: none;border:0;background-color:white;">안녕하</button>
							<button id="prochatbtn3" type="button" style="height:42px;color: #ed8151;float:right;outline: none;border:0; background-color:white;">프로젝트대화</button>
						</div>
						
					</div>

					<div class="tab-content">
						<div id="chat" class="tab-pane fade in active">
						채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창
						</div>
						<div id="ptask" class="tab-pane fade">
						업무창업무창업무창업무창업무창업무창업무창업무창업무창업무창업무창업무창
						</div>
						<div id="gantt" class="tab-pane fade">
						간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠ㅍ
						</div>
						<div id="#files" class="tab-pane fade">
						파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들
 						</div>
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
<script type="text/javascript">

	//prouser Object list에 담을라고만듦
	var prouserlist=new Array();
	
	//display 화면 비율 조정
	$(document).ready(function() {
		var contentheight = $("#contentwrap").height();
		var contentwidth = $("#contentwrap").width();
		$(".container").css('height', contentheight);
		$(".container").css('width', contentwidth / 1.1);
		
		//프로젝트에 포함된 유저 리스트불러와라
		 $.ajax({
				type : 'GET',
				url : '/projectjoin/collaboration/'+<%=pcode%>,
				success : function(response) {
					if(response.projectJoinList.length>0){
						alert('ok');
						for(var i=0;i<response.projectJoinList.length;i++){
							if(response.projectJoinList[i].pinvite==1){
								//0 : {'id' ='d' , .... } , Object 생성
								var prouserObj=new Object();
								prouserObj.uid=response.projectJoinList[i].uid;
								prouserObj.pinvite=response.projectJoinList[i].pinvite;
								prouserObj.ppermission=response.projectJoinList[i].ppermission;
								prouserlist.push(prouserObj);
							}
						}
						alert(prouserlist);
						
					}
					else{
						alert('엘허');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
	});
	
	//탭 새로고침시 현재 탭 유지  fewe
	if (location.hash) {
		$("a[href='" + location.hash + "']").tab("show");
	}
	$(document.body).on("click", "a[data-toggle]", function(event) {
		location.hash = this.getAttribute("href");
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