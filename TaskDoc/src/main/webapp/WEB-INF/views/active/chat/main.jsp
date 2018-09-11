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
					<div  style="width: 100%; height: 93%; display:-webkit-box; ">
						
						<div id="leftchatlist" style="width:15%; height:100%; background-color:yellow;">
							
							<div id="chatlistTOP" style="width:100%;height:20%; border:solid 1px blue;">
								<span id="prochatspan"></span>
							</div>
							
							<div id="chatlistBOTTOM" style="width:100%;height:80%; border:solid 1px blue;">
								
							</div>
							
						</div>
						
						
						<div id="rightchtcontent" style="width:85%; height:100%; background-color:green;">
							
							<div id="chatsetbtn" style="width:100%;height:5%; border:solid 1px blue;">
								
								<img src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" style="height:100%; float:right;">
								
								<div id="chatsetbtnmenu" style="width:300px;height:500px; position: absolute; display:none;border:solid 1px blue;background-color:white; right:0px; ">
								</div>
								
							</div>
							
							<div id="chatcontent" style="width:100%;height:75%;border:solid 1px blue;">내용</div>
							<div id="chatconinput" class="bts" style="width:100%;height:20%; border:solid 1px blue;">
								<textarea class="form-control" style="width:100%;height:100%;font-size:17px;"></textarea>
							</div>
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
$("#chatsetbtn").on("click",function(){
	if($("#chatsetbtnmenu").css("display") == "none"){
		$("#chatsetbtnmenu").show(1000);
	}
	else
		$("#chatsetbtnmenu").hide(1000);

});
$(function(){
	//pro_header.jsp의 프로젝트 대화 div(position=absolute)의 left값에  proheadername + proheaderli + prochatbtn1 값을 넣어준다.
	//채팅 , 공용업무, 간트차트, 파일모아보기에 페이지별로 전부 넣어줘야한다.
	var pronamewidth = $("#proheadername").css('width');
	var proliwidth = $("#proheaderli").css('width');
	var prochatbtn1 = $("#prochatbtn1").css('width');
	$("#chathwamun").css('left',parseInt(pronamewidth) + parseInt(proliwidth) + parseInt(prochatbtn1));
	
	//채팅메뉴 누르면 나올 div(position=absolute)의 margin-top과 margin-right값을 설정해줘야한다.
	var prochatsetbtn=$("#chatsetbtn").css('height');
	var containermargin=$(".container").css('margin-left');
	
	$("#chatsetbtnmenu").css('margin-top',parseInt(prochatsetbtn)).css('margin-right',parseInt(containermargin) + 15 + "px");
	
	
});

 	
</script>
</html>



<!-- 	<script type="text/javascript">
		/* 프로젝트내에서 내가 참여하고 있는 채팅방 리스트 ( focus 제외 )*/ss
		var param = {
			'uid' : id,
			'pcode' : pcode
		};
		$.ajax({
			type : 'POST',
			url : '/chatroomjoin/room',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 리스트 조회 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 리스트 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/프로젝트내에서 내가 참여하고 있는 채팅방 리스트 ( focus 제외 ) */

		/* 채팅방에 참여 중인 유저 리스트 */
		var param = {
			'crcode' : '현재 채팅방  CROCODE',
			'pcode' : '내 프로젝트  PCODE'
		};
		$.ajax({
			type : 'POST',
			url : 'chatroomjoin/user',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 유저 리스트 조회 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 유저 리스트 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅방에 참여 중인 유저 리스트 */
		
		/* 채팅방에 참여 중인 유저 리스트 */
		var param = {
			'pcode' : '내 프로젝트  PCODE',
			'crcode' : '현재 채팅방  CROCODE',
			'uid' : '초대할 회원의 UID'
		};
		$.ajax({
			type : 'POST',
			url : 'chatroomjoin',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 유저 초대 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 유저 초대 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅방에 참여 중인 유저 리스트 */
		
		/* 채팅방에서 나가기 */
		var param = {
			'pcode' : '내 프로젝트  PCODE',
			'crcode' : '현재 채팅방  CROCODE',
			'uid' : '채팅방 나갈 회원의 UID'
		};
		$.ajax({
			type : 'DELETE',
			url : 'chatroomjoin',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 나가기 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 나가기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅방에서 나가기 */
		
		
		/* 채팅 내용 DB저장 dmcode=null, dscode=null, crcoderef=null일경우
		일반 채팅 내용이다.
		*/
		var param = {
			'crcode' :'현재 채팅방 코드 CRCODE',
			'uid' :'채팅입력하고있는 UID',
			'ccontents' :'채팅내용저장',
		 	'dmcode' :'자료(파일)일경우 채팅창에표시하기위한것(채팅창에는 자료이름표시)',
			'dscode' :'의사결정일경우 채팅창에표시하기위한것(채팅창에는 의사결정제목표시)',
			'crcoderef' :'회의록채팅내용일경우 코드가필요하다' 
		};
		$.ajax({
			type : 'POST',
			url : 'chatcontents',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅 내용 입력성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 내용 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅 내용 DB저장 dmcode=null, dscode=null, crcoderef=null일경우
		일반 채팅 내용이다.
		*/
		
		/* 채팅 내용 조회 해보자.*/
		$.ajax({
			type : 'GET',
			url : 'chatcontents/'+'채팅내용을조회할 채팅방코드 crcode',
			success : function(response) {
				if (response.length != -1) {
					alert('채팅 내용 조회 성공!' + response);
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 내용 조회 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		/*/채팅 내용 조회 해보자.*/
	</script>
 -->