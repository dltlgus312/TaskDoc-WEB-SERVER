<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String crmode=request.getParameter("crmode");
	String crcode=request.getParameter("crcode");
	String crclose=request.getParameter("crclose");
	String crcoderef=request.getParameter("crcoderef");
%>	

<script>
$(function(){
	var screenW = screen.availWidth;  
	var screenH = screen.availHeight;
	var popW = 600; 
	var popH = 350; 
	var posL=( screenW-popW ) / 2;   
	var posT=( screenH-popH ) / 2;    
	
	//채팅메뉴 누르면 나올 div(position=absolute)의 margin-top과 margin-right값을 설정해줘야한다.
	var prochatsetbtn=$("#chatsetbtn").css('height');
	var containermargin=$(".container").css('margin-left');
	
	//chatsetbtnmenu제어
	$("#chatsetbtnmenu").css('margin-top',parseInt(prochatsetbtn)).css('margin-right',parseInt(containermargin) + 15 + "px");
	stompClient.disconnect();
});
</script>

<!--채팅방 클릭시 나와야할 div들  -->
<div id="chatmenu" style="width:100%%; height:100%;">
	<div id="chatsetbtn" style="width:100%;height:5%; border:solid 1px blue;">
	<div id="chatsetbtnmenu" style="width:300px;height:500px; position: absolute; display:none;border:3px solid #ed8151;background-color:white; right:0px;overflow:auto; ">
	</div>
</div>
								
<div id="chatcontentdiv" style="width:100%;height:75%;border:solid 1px blue; overflow:auto; background-color: #e0e0e0"></div>				
	<div id="chatconinput" class="bts" style="width:100%;height:20%; border:solid 1px blue; display:-webkit-box;">
		<textarea id="chatcontent" class="form-control" style="width:95%;height:100%;font-size:17px; resize: none;"></textarea>
		<button type="button" onclick="chattest(0,0,<%=crcoderef %>,<%=crcode %>)" style="font-size:18px;">테스트</button>
	</div>
</div>	 

<script>
   
var pageopen=true;
$(function(){
	
	//프로젝트톡, OWNER
	if(parseInt(<%=crmode%>)==1 &&chatpermission=="OWNER"){
		$setdiv='<img onclick="votercreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_voter.png" data-toggle="tootlip" data-placement="bottom" title="의사 결정 생성"  style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="자료 업로드" style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="conferencecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_conference.png"data-toggle="tootlip" data-placement="bottom" title="회의록 생성" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 1 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">자료<div id="dlist"></div></div>'
		+'<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">의사결정<div id="delist"></div></div>'
		+'<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">회의록<div id="clist"></div></div>'
		+'<div id="ulist"style="width:100%;height:24%; overflow:auto;">참여중인 회원<div id="userlist"> </div></div>'
		+'<div class="bts" style="width:100%;height:4%;"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button></div>';
		$("#chatsetbtnmenu").append($setmenudiv);
	}
	
	//프로젝트톡, MEMBER
	else if(parseInt(<%=crmode%>)==1 && chatpermission=="MEMBER"){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png"data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 1 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div style="overflow:auto; width:100%;height:100px; border-bottom: 3px solid #ed8151;">자료<div id="dlist"></div></div>'
		+'<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">의사 결정<div id="delist"></div></div>'
		+'<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">회의록<div id="clist"></div></div>'
		+'<div id="ulist" style="width:100%;height:24%; overflow:auto;">참여중인 회원<div id="userlist"></div></div>'
		+'<div class="bts" style="width:100%;height:4%;"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button></div>';
		$("#chatsetbtnmenu").append($setmenudiv);
		
	}
	
	//개인톡
	else if(parseInt(<%=crmode%>)==2){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 2 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div style="overflow:auto; width:100%; height: calc(500 / 3)px;border-bottom: 3px solid #ed8151;">자료<div id="dlist"></div></div><div id="ulist" >참여중인 회원 <div id="userlist">'
		+'</div></div><div class="bts"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatout('+<%=crcode%>+')">나가기</button><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button> </div>';
		$("#chatsetbtnmenu").append($setmenudiv);
	}
	
	//회의록, OWNER
	else if(parseInt(<%=crmode%>)==3 &&chatpermission=="OWNER"){
		$setdiv='<img onclick="votercreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_voter.png" data-toggle="tootlip" data-placement="bottom" title="의사 결정 생성"  style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png" data-toggle="tootlip" data-placement="bottom" title="자료 업로드" style="height:100%;float:left;padding-right:30px;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 3 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">자료<div id="dlist"></div></div>'
		+'<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">의사결정<div id="delist"></div></div>'
		+'<div id="ulist"style="width:100%;height:24%; overflow:auto;">참여중인 회원<div id="userlist"> </div></div>'
		+'<div class="bts" style="width:100%;height:4%;"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button>'
		+'<button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="confeclose('+<%=crcode%>+')">회의록종료</button></div>';
		$("#chatsetbtnmenu").append($setmenudiv); 
	}
	
	//회의록, MEMBER
	else if(parseInt(<%=crmode%>)==3 && chatpermission=="MEMBER"){
		$setdiv='<img onclick="filecreate('+<%=crcode%>+')" src="${pageContext.request.contextPath }/resources/img/img_fileupload.png"data-toggle="tootlip" data-placement="bottom" title="파일 업로드" style="height:100%;float:left;cursor:pointer;">'
		+'<img onclick="menubtn('+<%=crcode%>+','+ 1 +')" src="${pageContext.request.contextPath }/resources/img/img_chatmenubtn.png" data-toggle="tootlip" data-placement="left" title="메뉴" style="height:100%;float:right;cursor:pointer;">';
		$("#chatsetbtn").append($setdiv);
		
		$setmenudiv= '<div style="overflow:auto; width:100%;height:100px; border-bottom: 3px solid #ed8151;">자료<div id="dlist"></div></div>'
		+'<div style="overflow:auto; width:100%;height:24%; border-bottom: 3px solid #ed8151;">의사 결정<div id="delist"></div></div>'
		+'<div id="ulist" style="width:100%;height:24%; overflow:auto;">참여중인 회원<div id="userlist"></div></div>'
		+'<div class="bts" style="width:100%;height:4%;"><button class="btn" type="button" style="background-color:#ed8151; color:white;" onclick="chatclose()">닫기</button></div>';
		$("#chatsetbtnmenu").append($setmenudiv); 
		
	}
	
	//툴팁제어
	$('[data-toggle="tootlip"]').tooltip();
	var chatObj=new Object();
	var deciObj=new Object();
	var docuObj=new Object();
	
	var socket = new SockJS('/goStomp'); 
	
	stompClient = Stomp.over(socket);
	
	//채팅 append 여기서다함
    stompClient.connect({}, function() { //접속
         stompClient.subscribe('/project/'+pcode, function(msg) {
        	 var test=msg.body;
        	 var concat=JSON.parse(test);
        	 $("#chat"+concat.object.crcode).remove();
        	 $("#chats"+concat.object.crcode).remove();
        	
        	 if(concat.type == "chatroomvo"){
        		 chatObj.crcode= concat.object.crcode;
        		 chatObj.crmode= concat.object.crmode;
        		 chatObj.crclose= concat.object.crclose;
        		 chatObj.crcoderef= concat.object.crcoderef;
    		 }
        	 
        	 if(concat.type == "decisionvo"){
        		 deciObj.dscode= concat.object.dscode;
        		 deciObj.dsdate=concat.object.dsdate;
        		 deciObj.dstitle=concat.object.dstitle;
        		 deciObj.dsclose=concat.object.dsclose;
        		 deciObj.crcode=concat.object.crcode;
        		 deciObj.tcode=concat.object.tcode;
        	 }
        	 
        	 if(concat.type=="documentvo"){
        		 docuObj.dmcode=concat.object.dmcode;
        	 }
        	 
        	 if(concat.type == "chatcontentsvo"){
        		 if(parseInt(<%=crcode%>)==concat.object.crcode){
        			 if(Object.keys(chatObj).length<=0 && Object.keys(deciObj).length<=0){
	        			 alert('나능 프로젝틍 or 개인 일반대화 or 회의록 대화');
		        		 $("#croomSpan"+concat.object.crcode).append('<span id="chat'+concat.object.crcode+'">'+concat.object.uid+" : "+concat.object.ccontents+'('+concat.object.cdate+')'+'</span>');
		        		 $("#croomsSpan"+concat.object.crcode).append('<span id="chats'+concat.object.crcode+'">'+concat.object.uid+" : "+concat.object.ccontents+'('+concat.object.cdate+')'+'</span>');
		        		 $aaa='<div><span>'+concat.object.uid+' : '+ concat.object.ccontents +'('+concat.object.cdate+')'+'</span></div>';
		        	 	 $("#chatcontentdiv").append($aaa);
        		 	}
        			 //의사결정 링크
        			 if(Object.keys(deciObj).length>0 && Object.keys(chatObj).length<=0){
        		 		 alert('나능 프로젝트 또는 회의록 의사결정 생성');
		        		//얘는 leftlist 에 뜨는거 
			        	 $("#croomSpan"+concat.object.crcode).append('<span id="chat'+concat.object.crcode+'">'+concat.object.uid+" : <프로젝트 투표>"+concat.object.ccontents+'('+concat.object.cdate+')'+'</span>');
			        	 //얘는 프로젝트대화 메뉴에뜨는거
			        	 $("#croomsSpan"+concat.object.crcode).append('<span id="chats'+concat.object.crcode+'">'+concat.object.uid+" :<프로젝트 투표> "+concat.object.ccontents+'('+concat.object.cdate+')'+'</span>');
			        	 //얘는 chatcontent에 뜨는거임
			        	 $aaa='<div><span>'+concat.object.uid+' : <a onclick="selectDecision(\''+chatpermission+'\','+deciObj.dscode+')">'+'<프로젝트 투표>'+ concat.object.ccontents +'('+concat.object.cdate+')'+'</a></span></div>';
			        	 $("#chatcontentdiv").append($aaa);
        		 	}
        			 //회의록 링크
        			 if(Object.keys(chatObj).length>0 && Object.keys(deciObj).length<=0){
        				 alert('나는 회의록 생성');
        				//얘	는 leftlist 에 뜨는거 
 		        		$("#croomSpan"+concat.object.crcode).append('<span id="chat'+concat.object.crcode+'">'+concat.object.uid+" : <프로젝트 회의록>"+concat.object.ccontents+'('+concat.object.cdate+')'+'</span>');
 		        		//얘는 프로젝트대화 메뉴에뜨는거
 		        		$("#croomsSpan"+concat.object.crcode).append('<span id="chats'+concat.object.crcode+'">'+concat.object.uid+" :<프로젝트 회의록> "+concat.object.ccontents+'('+concat.object.cdate+')'+'</span>');
 		        		//얘는 chatcontent에 뜨는거임
 		        		$aaa='<div><span>'+concat.object.uid+' : <a onclick="goconference('+chatObj.crcode+','+ chatObj.crmode+','+chatObj.crclose+','+chatObj.crcoderef+')">'+'<프로젝트 회의록>'+ concat.object.ccontents +'('+concat.object.cdate+')'+'</a></span></div>';
 		        		$("#chatcontentdiv").append($aaa);
        			 }
        		 }
        	 }
         });
	});
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
							+'<span style="font-size:20px;cursor:pointer;" onclick="selectDecision(\''+chatpermission+'\','+response[i].dscode+')">'+response[i].dstitle+ '</span></div>';
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
			
			//회의록 조회
			$.ajax({
				type : 'GET',
				url : '/chatroom/room/'+code,
				success : function(response) {
					if (response.length>0) {
						alert('회의록 조회 성공');
						for(var i=0;i<response.length;i++){
							$delist='<div style="margin-bottom:3px;"><img src="${pageContext.request.contextPath }/resources/img/img_confe.png" style="width:32px;height:32px;">'
							+'<span style="font-size:20px;cursor:pointer;" onclick="goconference('+response[i].crcode+','+response[i].crmode+','+response[i].crclose+','+response[i].crcoderef+')">'+response[i].fctitle+ '</span></div>';
							$("#clist").append($delist);
						}
					} else{
						alert('Server or Client ERROR, 회의록 조회 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		}
			else if(crmode==3){
				//의사결정을 조회해 보자
				$.ajax({
					type : 'GET',
					url : '/decision/room/'+code,
					success : function(response) {
						if (response.length>0) {
							alert('의사 결정 조회 성공');
							for(var i=0;i<response.length;i++){
								$delist='<div style="margin-bottom:3px;"><img src="${pageContext.request.contextPath }/resources/img/img_vote.png" style="width:32px;height:32px;">'
								+'<span style="font-size:20px;cursor:pointer;" onclick="selectDecision(\''+chatpermission+'\','+response[i].dscode +')'+'">'+response[i].dstitle+ '</span></div>';
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
function selectDecision(chatpermission, dscode)
{
	// 의사결정 고르기(종료 여부는 페이지 들어가서 확인)
	window.open("/chat/decisionSelect?chatpermission="+chatpermission+"&dscode="+dscode, "", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
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

//회의록 입성 
function goconference(crcode,crmode,crclose,crcoderef)
{
	if(confirm('회의록에 입장하시겠습니까?')==true){
		alert(crcode);
		alert(crmode);
		alert(crclose);
		alert(crcoderef);
		$("#rightchatlist").load("/chat/content?crcode="+crcode+"&crmode="+crmode+"&crclose="+crclose+"&crcoderef="+crcoderef+"&pcode="+pcode); 
	}else return;

}

//회의록 종료
function confeclose(crcode){
	alert(crcode+"종료");
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
	stompClient.disconnect();
	$("#chatmenu").remove();
	
}



//message : insert, type : chatcontents, object : ChatContentsVO
function chattest(dmcode,dscode,crcoderef,crcode,dstitle){
	alert('들ㅇ오냐?');
	
	if(crcode==parseInt(<%=crcode%>)){
		//채팅
		if(dmcode==0 && dscode==0){
			var param={
				 'message' : 'insert',
				 'type' : 'chatcontentsvo',
				 'object' :{
						 'crcode' : <%=crcode%>,
					 	 'uid' : id,
						 'ccontents' : $("#chatcontent").val(),
						 'dmcode' : dmcode,
						 'dscode' : dscode,
						 'crcoderef' : <%=crcoderef%>
					 }
				 };
		}
		
		//의사결정
		if(dscode!=0 && dmcode==0){
			var param={
				 'message' : 'insert',
				 'type' : 'chatcontentsvo',
				 'object' :{
						 'crcode' : <%=crcode%>,
					 	 'uid' : id,
						 'ccontents' : dstitle,
						 'dmcode' : dmcode,
						 'dscode' : dscode,
						 'crcoderef' : <%=crcoderef%>
					 }
				 };
		}
		
		//자료 올리깅 
		if(dscode==0 && dmcode!=0){
			var param={
				 'message' : 'insert',
				 'type' : 'chatcontentsvo',
				 'object' :{
						 'crcode' : <%=crcode%>,
					 	 'uid' : id,
						 'ccontents' : dstitle,
						 'dmcode' : dmcode,
						 'dscode' : dscode,
						 'crcoderef' : <%=crcoderef%>
					 }
				 };
		}
		
		stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param));
	}
<%-- 
		//프로젝트채팅창의 의사결정 chacontents db로 쏘는거임	
		else if(dmcode==0 && dscode!=0&& crcoderef==0){
			var param={
					 'message' : 'insert',
					 'type' : 'chatcontentsvo',
					 'object' :{
							 'crcode' : <%=crcode%>,
						 	 'uid' : id,
							 'ccontents' : dstitle,
							 'dmcode' : dmcode,
							 'dscode' : dscode,
							 'crcoderef' : crcoderef
						 }
				 };
			}
		
		//프로젝트채팅방창의 회의록 chatcontents db로 쏘기
		else if(dmcode==0 && dscode==0 && crcoderef!=0){
			var param={
					 'message' : 'insert',
					 'type' : 'chatcontentsvo',
					 'object' :{
							 'crcode' : <%=crcode%>,
						 	 'uid' : id,
							 'ccontents' : dstitle,
							 'dmcode' : dmcode,
							 'dscode' : dscode,
							 'crcoderef' : crcoderef
						 }
					};
				}
		
		//프로젝트채팅방의 자료 올려보리기
		else if(dmcode!=0 && dscode==0 && crcoderef==0){
			alert('자료');
			var param={
					 'message' : 'insert',
					 'type' : 'chatcontentsvo',
					 'object' :{
							 'crcode' : <%=crcode%>,
						 	 'uid' : id,
							 'ccontents' : dstitle,
							 'dmcode' : dmcode,
							 'dscode' : dscode,
							 'crcoderef' : crcoderef
						 }
					};
				}
			stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param));
		}
		
		//개인 채팅
		else if(parseInt(<%=crmode%>)==2){
			if(dmcode==0 && dscode==0 && crcoderef==0){
					var param={
							 'message' : 'insert',
							 'type' : 'chatcontentsvo',
							 'object' :{
									 'crcode' : <%=crcode%>,
								 	 'uid' : id,
									 'ccontents' : $("#chatcontent").val(),
									 'dmcode' : dmcode,
									 'dscode' : dscode,
									 'crcoderef' : crcoderef
								 }
							 };
					}
			
			else if(dmcode!=0 && dscode==0 && crcoderef==0){
				alert('개인 자료');
				var param={
						 'message' : 'insert',
						 'type' : 'chatcontentsvo',
						 'object' :{
								 'crcode' : <%=crcode%>,
							 	 'uid' : id,
								 'ccontents' : dstitle,
								 'dmcode' : dmcode,
								 'dscode' : dscode,
								 'crcoderef' : crcoderef
							 }
						};
					}
				stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param));
		}
	
	//회의록 기본채팅
	else if(parseInt(<%=crmode%>)==3){
		if(dmcode==0 && dscode!=0 && parseInt(<%=crcoderef%>)>=0){
			alert('회의록 의사결정');
			var param={
					 'message' : 'insert',
					 'type' : 'chatcontentsvo',
					 'object' :{
							 'crcode' : <%=crcode%>,
						 	 'uid' : id,
							 'ccontents' : dstitle,
							 'dmcode' : dmcode,
							 'dscode' : dscode,
							 'crcoderef' : <%=crcoderef%>
						 }
					};
		}
			stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param));
		} --%>
}

 //서버 전송
 function decitest(dscode,dsdate,dstitle,dsclose,crcode,tcode){
	//이거는 서버로 보내는거임
	//프로젝트채팅 창의 의사결정
		var param={
			 'message' : 'insert',
			 'type' : 'decisionvo',
			 'object' :{
					 'dscode' : dscode,
				 	 'dsdate' : dsdate,
					 'dstitle' : dstitle,
					 'dsclose' : dsclose,	
					 'crcode' : crcode,
					 'tcode' : tcode
				}
		 };
		stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param));
}
 //서버 전송
 function focutest(crcode,crdate,crmode,fctitle,crclose,tcode,crcoderef){
	var param={
			 'message' : 'insert',
			 'type' : 'chatroomvo',
			 'object' :{
					 'crcode' : crcode,
				 	 'crdate' : crdate,
					 'crmode' : crmode,
					 'fctitle' : fctitle,	
					 'crclose' : crclose,
					 'tcode' : tcode,
					 'crcoderef' : crcoderef
				}
		 };
	stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param));
} 
 
 //서버 전송
 function docutest(dmcode,dmtitle,dmcontents,dmdate,crcode,tcode,uid){
	 var param={
			 'message' : 'insert',
			 'type' : 'documentvo',
			 'object' :{
					 'dmcode' : dmcode,
				 	 'dmtitle' : dmtitle,
					 'dmcontents' : dmcontents,
					 'dmdate' : dmdate,	
					 'crcode' : crcode,
					 'tcode' : tcode,
					 'uid' : uid
				}
		 };
	stompClient.send('/app/webproject/'+pcode, {},JSON.stringify(param)); 
 }
</script>
