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
	</div>
</div>
								
<div id="chatcontentdiv" style="width:100%;height:75%;border:solid 1px blue; overflow:auto;"></div>				
	<div id="chatconinput" class="bts" style="width:100%;height:20%; border:solid 1px blue; display:-webkit-box;">
		<textarea id="chatcontent" class="form-control" style="width:95%;height:100%;font-size:17px; resize: none;"></textarea>
		<button type="button" onclick="chattest()" style="font-size:18px;">테스트</button>
	</div>
</div>	

<script>
//채팅방에 들어갔는지 안들어갔는지 체크
    <%-- stompClient.subscribe('/chat/'+<%=crcode%>, function(msg) {
   	 var test=msg.body;
   	 var concat=JSON.parse(test);
   	alert(concat);
    }); --%>
var screenW = screen.availWidth;  // 스크린 가로사이즈
var screenH = screen.availHeight; // 스크린 세로사이즈
var popW = 600; // 띄울창의 가로사이즈
var popH = 350; // 띄울창의 세로사이즈
var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션     
   
var pageopen=true;
$(function(){
	//채팅메뉴 누르면 나올 div(position=absolute)의 margin-top과 margin-right값을 설정해줘야한다.
	var prochatsetbtn=$("#chatsetbtn").css('height');
	var containermargin=$(".container").css('margin-left');
	
	//chatsetbtnmenu제어
	$("#chatsetbtnmenu").css('margin-top',parseInt(prochatsetbtn)).css('margin-right',parseInt(containermargin) + 15 + "px");
	
	//프로젝트톡, OWNER
	if(parseInt(<%=crmode%>)==1 &&chatpermission=="OWNER"){
		$setdiv='<img onclick="votercreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_voter.png" data-toggle="tootlip" data-placement="bottom" title="의사 결정 생성"  style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="자료 업로드" style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="conferencecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_conference.png"data-toggle="tootlip" data-placement="bottom" title="회의록 생성" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 1 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div id="dlist" style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">자료</div>'
		+'<div id="delist" style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">의사결정</div>'
		+'<div style="width:100%;height:24%; border-bottom: 3px solid #ed8151;">회의록</div>'
		+'<div id="ulist"style="width:100%;height:24%; overflow:auto;">참여중인 회원<div id="userlist"> </div></div>'
		+'<div class="bts" style="width:100%;height:4%;"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button></div>';
		$("#chatsetbtnmenu").append($setmenudiv);
	}
	
	//프로젝트톡, MEMBER
	else if(parseInt(<%=crmode%>)==1 && chatpermission=="MEMBER"){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png"data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 1 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div id="dlist" style="overflow:auto; width:100%;height:100px; border-bottom: 3px solid #ed8151;">자료</div>'
		+'<div id="delist" style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">의사결정</div>'
		+'<div style="width:100%;height:24%; border-bottom: 3px solid #ed8151;">회의록</div>'
		+'<div id="ulist" style="width:100%;height:24%; overflow:auto;">참여중인 회원<div id="userlist"></div></div>'
		+'<div class="bts" style="width:100%;height:4%;"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button></div>';
		$("#chatsetbtnmenu").append($setmenudiv);
		
	}
	
	//개인톡
	else if(parseInt(<%=crmode%>)==2){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 2 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div id="dlist" style="overflow:auto; width:100%; height: calc(500 / 3)">자료</div><div id="ulist" >참여중인 회원 <div id="userlist">'
		+'</div></div><div class="bts"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatout('+<%=crcode%>+')">나가기</button><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button> </div>';
		$("#chatsetbtnmenu").append($setmenudiv);
	}
	//툴팁제어
	$('[data-toggle="tootlip"]').tooltip();
	
});

//메뉴버튼열기, param - crcode
function menubtn(code, crmode){
	if($("#chatsetbtnmenu").css("display") == "none"){
			$("#chatsetbtnmenu").show(1000);
			
			//메뉴열 때 delist의 하위 요소 모두 삭제
			$("#delist").empty();
			$("#dlist").empty();
			$("#userlist").empty();
			
			// 채팅방에 참여 중인 유저 리스트 
			var param = {
				'crcode' : code,
				'pcode' : pcode
			};
			
			//채팅방에 초대되어있는 유저
			$.ajax({
				type : 'POST',
				url : '/chatroomjoin/user',
				contentType : 'application/json',
				data : JSON.stringify(param),
				success : function(response) {
					if (response.length != -1) {
						for(var i=0;i<response.length;i++){
							$ulist='<div style="margin-bottom:3px;"><img src="${pageContext.request.contextPath }/resources/img/img_owner.png" style="width:32px;height:32px;">'
							+'<span style="font-size:20px;">' +response[i].uname+'('+response[i].uid + ')'+ '</span></div>';
							$("#userlist").append($ulist);
						}
					} else if (response.length == 0) {
						alert('Server or Client ERROR, 채팅방 유저 리스트 조회 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
			
			//자료를 조회해 보자
			$.ajax({
				type : 'GET',
				url : '/document/room/'+code,
				success : function(response) {
					if (response.length>0) {
						alert('자료 조회 성공')
						for(var i=0;i<response.length;i++){
							$dlist='<div style="margin-bottom:3px;"><img src="${pageContext.request.contextPath }/resources/img/img_filetask.png" style="width:32px;height:32px;">'
							+'<span style="font-size:20px;cursor:pointer;" onclick="fileDownload('+response[i].dmcode+')">' +response[i].dmtitle+'('+response[i].uid + ')'+ '</span></div>';
							$("#dlist").append($dlist);
						}
					} else{
						alert('Server or Client ERROR, 자료가없습니다.');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
			
			if(crmode==1){
			//의사결정을 조회해 보자
			$.ajax({
				type : 'GET',
				url : '/decision/room/'+code,
				success : function(response) {
					if (response.length>0) {
						alert('의사 결정 조회 성공');
						for(var i=0;i<response.length;i++){
							$delist='<div style="margin-bottom:3px;"><img src="${pageContext.request.contextPath }/resources/img/img_vote.png" style="width:32px;height:32px;">'
							+'<span style="font-size:20px;cursor:pointer;" onclick="selectDecision(\''+response[i].dstitle + ',' + response[i].dsdate +'\',' +response[i].dscode+','+response[i].dsclose+','+response[i].tcode+ ')">'+response[i].dstitle+ '</span></div>';
							$("#delist").append($delist);
						}
					} else{
						alert('Server or Client ERROR, 의사 결정 조회 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		}
	}
	else $("#chatsetbtnmenu").hide(1000);
} 

//의사결정생성 
function votercreate(code){
	alert(code+"의사결정");
	if(confirm('투표를 생성하시겠습니까?')==true){
		window.open("/chat/decisionCreate?crcode="+code+"&pcode="+pcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
		}
	else return;
	}

//의사결정 조회
function selectDecision(dstitle, dscode, dsclose,tcode)
{
	var list=[];
	list=dstitle.split(",");
	alert(list[0]);
	alert(list[1]);
	
	// 의사결정 종료
	if(dsclose>0)
		window.open("/chat/decisionView?dscode="+dscode+"&dstitle="+list[0] +"&dsdate="+list[1] +"&permission="+chatpermission, "", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
	
	// 의사결정 종료X
	else	
		window.open("/chat/decisionSelect?dscode="+dscode+"&dstitle="+list[0] +"&dsdate="+list[1] +"&permission="+chatpermission +"&tcode="+tcode ,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
}	

//자료 업로드
function filecreate(code){
	alert(code+"자료 업로드");
	var popH = 450; // 띄울창의 세로사이즈
	if(confirm('자료를 업로드 하시겠습니까?')==true){
		window.open("/chat/fileUpload?crcode="+code+"&pcode="+pcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
		}
	else return;
}

//자료 다운할 window
function fileDownload(code){
	window.open("/chat/fileDownload?dmcode="+code,"",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); }

//회의록생성
function conferencecreate(crcode){
	if(confirm('회의록을 만드시겠습니까?')==true){
		window.open("/chat/focusCreate?crcode="+crcode+"&pcode="+pcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
		}
	else return;
}

//채팅방나가기
function chatout(crcode){
	if(confirm('채팅방에서 나가시겠습니까?')==true){
		var param = {
			'pcode' : pcode,
			'crcode' : crcode,
			'uid' : id
		};
		$.ajax({
			type : 'DELETE',
			url : '/chatroomjoin',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response.length != -1) {
					alert('채팅방 나가기 성공!' + response);
					location.href="/project/chat/main?pcode="+ pcode;
				} else if (response.length == 0) {
					alert('Server or Client ERROR, 채팅방 나가기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}else return;
}

//채팅방 닫기
function chatclose(){
	pageopen=false;
	$("#chatmenu").remove();
}



//message : insert, type : chatcontents, object : ChatContentsVO
function chattest(){
	var param={
		 'message' : 'insert',
		 'type' : 'chatcontentsvo',
		 'object' :{
				 'crcode' : <%=crcode%>,
			 	 'uid' : id,
				 'ccontents' : $("#chatcontent").val()
			 }
	 };
	stompClient.send('/app/project/'+pcode, {},JSON.stringify(param));
}
</script>
	
	

	
	
	
<!-- 	<script type="text/javascript">

		
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