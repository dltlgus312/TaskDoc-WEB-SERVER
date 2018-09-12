<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String crmode=request.getParameter("crmode");
String crcode=request.getParameter("crcode");
%>	
<!--채팅방 클릭시 나와야할 div들  -->
<div id="chatmenu" style="width:100%%; height:100%;">
	<div id="chatsetbtn" style="width:100%;height:5%; border:solid 1px blue;">
	<div id="chatsetbtnmenu" style="width:300px;height:500px; position: absolute; display:none;border:3px solid #ed8151;background-color:white; right:0px;overflow:auto; ">
		<div>업로드된 파일</div>
		<div>의사결정</div>
		<div>회의록</div>
		<div>참여중인 회원</div>
		<div>나가기</div>
	</div>
</div>
								
<div id="chatcontent" style="width:100%;height:75%;border:solid 1px blue;"></div>				
	<div id="chatconinput" class="bts" style="width:100%;height:20%; border:solid 1px blue;">
		<textarea class="form-control" style="width:100%;height:100%;font-size:17px; resize: none;"></textarea>
	</div>
</div>	

<script>
$(function(){
	//채팅메뉴 누르면 나올 div(position=absolute)의 margin-top과 margin-right값을 설정해줘야한다.
	var prochatsetbtn=$("#chatsetbtn").css('height');
	var containermargin=$(".container").css('margin-left');
	
	//chatsetbtnmenu제어
	$("#chatsetbtnmenu").css('margin-top',parseInt(prochatsetbtn)).css('margin-right',parseInt(containermargin) + 15 + "px");

	//프로젝트톡, OWNER
	if(parseInt(<%=crmode%>)==1 &&chatpermission=="OWNER"){
		$setdiv='<img onclick="votercreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_voter.png" data-toggle="tootlip" data-placement="bottom" title="의사 결정 생성"  style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="conferencecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_conference.png"data-toggle="tootlip" data-placement="bottom" title="회의록 생성" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
	}
	
	//프로젝트톡, MEMBER
	else if(parseInt(<%=crmode%>)==1 && chatpermission=="MEMBER"){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png"data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
	}
	
	//개인톡
	else if(parseInt(<%=crmode%>)==2){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
	}
	//툴팁제어
	$('[data-toggle="tootlip"]').tooltip();

});

//메뉴버튼열기
function menubtn(code){
	if($("#chatsetbtnmenu").css("display") == "none"){
			$("#chatsetbtnmenu").show(1000);
		}
	else $("#chatsetbtnmenu").hide(1000);
} 

//의사결정생성 
function votercreate(code){
	alert(code+"의사결정");
	var screenW = screen.availWidth;  // 스크린 가로사이즈
	var screenH = screen.availHeight; // 스크린 세로사이즈
	var popW = 600; // 띄울창의 가로사이즈
	var popH = 350; // 띄울창의 세로사이즈
	var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
	var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
	if(confirm('투표를 생성하시겠습니까?')==true){
		window.open("/chat/decisionCreate?crcode="+code+"&pcode="+pcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
		}
	else return;
	}

//파일업로드
function filecreate(code){
	alert(code+"파일업로드");
}

//회의록생성
function conferencecreate(code){
	alert(code+"회의록");
}

</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 	<script type="text/javascript">

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