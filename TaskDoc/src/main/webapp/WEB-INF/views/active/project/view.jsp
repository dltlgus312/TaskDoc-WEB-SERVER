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
				<div class="container"
					style="background-color: white; overflow: auto;">
					<div id="proheader"
						style="display: -webkit-box; width: 100%; height: 7%; border-bottom:1px solid gray;">
						<div id="proheadername" style="width: 25%;">
							<span id="pro_title" style="color: black; font-size:25px;">프로젝트명 : <%=ptitle %></span>
						</div>

						<div id="proheaderli" style="width: 50%; text-align: center;">
							<a class="chat_hover" id="z" data-toggle="tab" href="#chats"
								style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">채팅</a>
							<a class="ptask_hover" data-toggle="tab" href="#ptasks"
								style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">공용
								업무</a> <a class="gantt_hover" data-toggle="tab" href="#gantts"
								style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">간트차트</a>
							<a class="files_hover" data-toggle="tab" href="#files"
								style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">파일
								모아보기</a>
						</div>

						<div id="proheaderbtn" style="width: 25%; display:-webkit-box;">
							
							<div style="width: calc(100% / 3); height:40px;">
								<button id="prochatbtn3" type="button"
									style="height: 42px; float: right; outline: none; border: 0; background-color: white;width:100%;">
									<img
										src="${pageContext.request.contextPath }/resources/img/img_chat.png"
										alt="" style="width: 15px; height: 15px;">
									<span>프로젝트 대화</span>
								</button>
							</div>
							
							<div class="dropdown" style="width: calc(100% / 3); height:40px;">
								<button class="btn btn-primary dropdown-toggle" type="button" 
									data-toggle="dropdown" id="prochatbtn2" type="button"
									style="height: 42px; float: right; outline: none; border: 0; background-color: white; padding:0; width:100%;">
									<img
										src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"
										alt="" style="width: 15px; height: 15px;">
									<span id="propeople" style="color:black;"></span>
								</button>
								
								<ul id= "propeoplelist" class="dropdown-menu" style="right: 0;">
								</ul>
							</div>
							
							<div style="width: calc(100% / 3); height:40px;">							
								<button id="prochatbtn1" type="button"
									style="height: 42px; float: right; outline: none; border: 0; background-color: white;width:100%;">
									<img
										src="${pageContext.request.contextPath }/resources/img/img_boardsetting.png"
										alt="" style="width: 15px; height: 15px;">
									<span>설정</span>
								</button>
							</div>
							
						</div>
					</div>
					<div class="tab-content">
						<div id="chats" class="tab-pane fade in active">
							채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창채팅창ㄹㅈㄷㄹㄷㅈㄹ
							<div style="width: 300px; height: 300px; background-color: gray;">wefwef</div>
						</div>

						<div id="ptasks" class="tab-pane fade">
							업무창업무창업무창업무창업무창업무창업무창업무창업무창업무창업무창업무창</div>

						<div id="gantts" class="tab-pane fade">
							간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠간츠타츠ㅍ</div>

						<div id="files" class="tab-pane fade">
							파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들파일들</div>
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
	 $(".chat_hover").click(function(){
		 $(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
		$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
	 });
	 $(".ptask_hover").click(function(){
		$(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
		$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
	}); 
	 
	 $(".gantt_hover").click(function(){
		$(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
		$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
	}); 
	 
	 $(".files_hover").click(function(){
		$(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
		$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
		$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
	}); 
	 
	 
	 
	 
	 $(document).ready(function(){
	//prouser Object list에 담을라고만듦sssfe
	var prouserlist=new Array();
	
	//display 화면 비율 조정
		var contentheight = $("#contentwrap").height();
		var contentwidth = $("#contentwrap").width();
		$(".container").css('height', contentheight);
		$(".container").css('width', contentwidth / 1.1);
		
		var line_height = $("#proheader").height();
		$("#prochatbtn2").css('line-height',line_height+"px");
		$("#prochatbtn1").css('line-height',line_height+"px");
		$("#prochatbtn3").css('line-height',line_height+"px");
		$(".chat_hover").css('line-height',line_height+"px");
		$("#pro_title").css('line-height',line_height+"px");
		
		//프로젝트에 포함된 유저 리스트불러와라
		 $.ajax({
				type : 'GET',
				url : '/projectjoin/collaboration/'+<%=pcode%>,
				success : function(response) {
					if(response.projectJoinList.length>0){
						$("#propeople").text(response.projectJoinList.length);
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
						
					}
					alert(prouserlist);
					for(var j=0;j<prouserlist.length;j++){
						var $atag='<li><a href="#">'+prouserlist[j].ppermission+':'+prouserlist[j].uid+'</a></li>';
					}
					$("#propeoplelist").append($atag);
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
	$("#prochatbtn1").click(function(){
		alert('설정');
		 if(window.confirm('프로젝트 정보 수정  페이지를 띄우시겠습니까?')==true){
	    	 var screenW = screen.availWidth;  // 스크린 가로사이즈
	    	  var screenH = screen.availHeight; // 스크린 세로사이즈
	    	  var popW = 1000; // 띄울창의 가로사이즈
	    	  var popH = 800 // 띄울창의 세로사이즈
	    	  var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
	    	  var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
	    	 window.open("/project/infoEdit?pcode="+<%=pcode%>,"",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
		}
		else
			return;
	});
	
	
	
</script>

</html>