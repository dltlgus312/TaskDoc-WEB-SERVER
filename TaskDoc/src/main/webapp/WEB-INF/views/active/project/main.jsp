<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>

<%@include file="/WEB-INF/views/fix/header.jsp"%>

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String paramId = request.getParameter("id");
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
				<!--PROJECT 가입 O  -->
				<div id="containersTOP" style="margin-top: 20px;">

				</div>
				
				<!--position MEMBER  -->
				<div id="containersMIDDLE" style="margin-top: 50px;">
				</div>
				

				<!--PROJECT 초대 X  -->
				<div id="containersBOTTOM" style="margin-top: 50px;">
				</div>
				<button id="sibarshiafowe">wefwefew</button>
			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->

	</div>efef
	<!--FRAME  -->
</body>


<script type="text/javascript">
	$(document).ready(function() {
		
		$.ajax({
			type : 'GET',
			url : '/projectjoin/'+'<%=loginid%>' ,
			success : function(response) {
				if (response.projectJoinList.length>0) {
					/* projectList , projectJoinList */
					alert('개인별 프로젝트 조회 완료!');
					
					for(var i=0;i<response.projectJoinList.length;i++){
						/*프로젝트에 가입된 현황 pinvite==1 , 권한 OWNER  */
						if(response.projectJoinList[i].pinvite==1 && response.projectJoinList[i].ppermission=='OWNER'){
							console.log("pinvite==1 OWNER 시작"+i);
							var $div = $('<div class="projectlists"> <div class="projectheader" style="width: 100%;"><div class="headername"><span id="pro_titlename" style="color: black">'+response.projectList[i].ptitle+'</span>'
							+'</div><div class="headerimg"><button type="button" class="prosetinviteimg "><img alt=""src="${pageContext.request.contextPath }/resources/img/img_boardsetting.png"style="width: 18px; height: 18px;">'
							+'</button><button type="button" class="prosetinviteimg"><img alt=""src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"style="width: 18px; height: 18px;">'
							+'</button></div></div><div class="projectbottom" style="width: 100%; height:; display: block;">'
							+'<div id="pro_subdiv" style="width: 100%; height: 60%; overflow: auto;"><span id="pro_subtitlename" style="color: black">'+response.projectList[i].psubtitle+'</span></div><div id="pro_sdatediv" style="width: 100%; height: calc(40%/ 3);">'
							+'<span id="pro_sdate" style="color: black;">'+response.projectList[i].psdate+'</span></div><div id="pro_edatediv" style="width: 100%; height: calc(40%/ 3);"><span id="pro_edate" style="color: black;">'+response.projectList[i].pedate+'</span>'
							+'</div><div id="pro_posidiv" style="width: 100%; height: calc(40%/ 3)"><span id="pro_position"style="color: black; margin-right: 3px; float: right;">'+response.projectJoinList[i].ppermission+'</span>'
							+'</div></div></div>');
							$("#containersTOP").append($div);
							console.log("pinvite==1 OWNER 끝"+i);
							
						}
						
						/*프로젝트에 가입된 현황 pinvite==1 , 권한 MEMBER */
						else if(response.projectJoinList[i].pinvite==1 && response.projectJoinList[i].ppermission=='MEMBER')
						{
							console.log("pinvite==1  MEMBER 시작"+i);
							var $dsiv = $('<div class="projectlists"> <div class="projectheader" style="width: 100%;"><div class="headername" style="background-color: #5b66e8"><span id="pro_titlename" style="color: black">'+response.projectList[i].ptitle+'</span>'
									+'</div>'
									+'</div><div class="projectbottom" style="width: 100%; height:; display: block;">'
									+'<div id="pro_subdiv" style="width: 100%; height: 60%; overflow: auto;"><span id="pro_subtitlename" style="color: black">'+response.projectList[i].psubtitle+'</span></div><div id="pro_sdatediv" style="width: 100%; height: calc(40%/ 3);">'
									+'<span id="pro_sdate" style="color: black;">'+response.projectList[i].psdate+'</span></div><div id="pro_edatediv" style="width: 100%; height: calc(40%/ 3);"><span id="pro_edate" style="color: black;">'+response.projectList[i].pedate+'</span>'
									+'</div><div id="pro_posidiv" style="width: 100%; height: calc(40%/ 3)"><span id="pro_position"style="color: black; margin-right: 3px; float: right;">'+response.projectJoinList[i].ppermission+'</span>'
									+'</div></div></div>');
									$("#containersMIDDLE").append($dsiv);
							console.log("pinvite==1  MEMBER 끝"+i);
									
						}
							
						/*프로젝트에 초대된 현황  pinvite==0 */
						else if(response.projectJoinList[i].pinvite==0 && response.projectJoinList[i].ppermission=='MEMBER'){
							console.log("pinvite==0  MEMBER 시작"+i);
							var $dseiv = $('<div class="projectlists"> <div class="projectheader" style="width: 100%;"><div class="headername" style="background-color:#8b8886"><span id="pro_titlename" style="color: black">'+response.projectList[i].ptitle+'</span>'
									+'</div><div class="headerimg"><button type="button" class="prosetinviteimg"><img alt=""src="${pageContext.request.contextPath }/resources/img/img_boardsetting.png"style="width: 18px; height: 18px;">'
									+'</button><button type="button" class="prosetinviteimg"><img alt=""src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"style="width: 18px; height: 18px;">'
									+'</button></div></div><div class="projectbottom" style="width: 100%; height:; display: block;">'
									+'<div id="pro_subdiv" style="width: 100%; height: 60%; overflow: auto;"><span id="pro_subtitlename" style="color: black">'+response.projectList[i].psubtitle+'</span></div>	<div id="pro_sdatediv" style="width: 100%; height: calc(40%/ 3);">'
									+'<span id="pro_sdate" style="color: black;">'+response.projectList[i].psdate+'</span></div><div id="pro_edatediv" style="width: 100%; height: calc(40%/ 3);"><span id="pro_edate" style="color: black;">'+response.projectList[i].pedate+'</span>'
									+'</div><div id="pro_posidiv" style="width: 100%; height: calc(40%/ 3)"><span id="pro_position"style="color: black; margin-right: 3px; float: right;">'+response.projectJoinList[i].ppermission+'</span>'
									+'</div></div></div>');
									$("#containersBOTTOM").append($dseiv);
									console.log("pinvite==0  MEMBER 끝"+i);
						}
				}
				    $(".projectlists").css('width', $('#containersTOP').width() / 5 + "px").css('height', $('#contentwrap').height() / 4 + "px");
					$(".projectheader").css('height',$('.projectlists').height() * 0.25);
					$(".projectbottom").css('height',$('.projectlists').height() * 0.75); 
			
			}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		
		/*DIV TOP , BOTTOM , MIDDLE 범위나누기  */
		var contentWidth = $("#contentwrap").width();
		var contentHeight = $("#contentwrap").height();
		//$(".container").css('width',contentWidth + "px")
		$("#containersTOP").css('width', $('#contentwrap').width() / 1.3).css('margin-left', $('#contentwrap').width() / 6 + "px").css('height',contentHeight / 3);
		$("#containersBOTTOM").css('width', $('#contentwrap').width() / 1.3).css('margin-left', $('#contentwrap').width() / 6 + "px").css('height',contentHeight / 3);
		$("#containersMIDDLE").css('width', $('#contentwrap').width() / 1.3).css('margin-left', $('#contentwrap').width() / 6 + "px").css('height',contentHeight / 3);
		

	});
	
	$(function(){
		$("#sibarshiafowe").click(function(){
			alert('니니니닌');
		});
	});
	
	
</script>
</html>