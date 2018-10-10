<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String tcode=request.getParameter("tcode");
%>
<div id="LV1" style="width:24%; margin-right:1%;">
LV1
</div>

<script type="text/javascript">

$(document).ready(function(){
	//root 업무 한개 append
	$("#publictaskBOTTOM").css('display','-webkit-box');
	$.ajax({
		type : 'GET',
		url : '/publictask/publicTaskView/' + <%=tcode%>,
		success : function(response) {
			if (Object.keys(response).length > 0) {
					if(chatpermission=="OWNER"){
						var $append = '<div onclick="downtasklist('+response.tcode+', $(this).parent()[0].id)" id="publictask'+response.tcode+'" style="margin-right:1%; margin-bottom:10px; height: 200px; background-color: white;">'
						+'<div  style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response.tcolor+';"><span>'+ 1 +'. : '+response.ttitle+','+response.tcode+'</span></div>'
						+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
						+'<div style="margin-left:20px;" id="chart'+response.tcode+'" class="progress-pie-chart" data-percent="'+response.tpercent+'">'
						+'<div class="ppc-progress">'
						+'<div class="ppc-progress-fill" id="fill'+response.tcode+'"></div></div>'
						+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response.tcode +'">%</span></div></div></div>'
						+'<div><div><span>시작 날짜 : '+response.tsdate+'</span></div><div><span>종료 날짜 : '+response.tedate+'</span></div><div class="bts">'
						+'<button style="border:0px;outline:none;color:white;background-color:#ed8151; font-size:12px; margin-right:5px;" class="btn" type="button" onclick="downtaskcreate(\''+response.tsdate+ ',' +response.tedate+'\','+response.tcode+')">하위업무생성</button>'
						+'<button style="border:0px;outline:none;color:white;background-color:#ed8151; font-size:12px; margin-right:5px;" class="btn" onclick= "ptedit(\''+response.tsdate+ ',' +response.tedate+'\','+response.tcode+')" type="button">수정</button>'
						+'<button style="border:0px;outline:none;color:white;background-color:#ed8151; font-size:12px;" class="btn" type="button" onclick="ptdel('+response.tcode+')">삭제</button></div></div></div></div>';
					}
					
				  else if(chatpermission=="MEMBER"){
						var $append = '<div onclick="downtasklist('+response.tcode+', $(this).parent()[0].id)" id="publictask'+response.tcode+'" style="margin-right:1%; margin-bottom:10px; height: 200px; background-color: white;">'
						+'<div  style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response.tcolor+';"><span>'+ 1 +'. : '+response.ttitle+','+response.tcode+'</span></div>'
						+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
						+'<div style="margin-left:20px;" id="chart'+response.tcode+'" class="progress-pie-chart" data-percent="'+response.tpercent+'">'
						+'<div class="ppc-progress">'
						+'<div class="ppc-progress-fill" id="fill'+response.tcode+'"></div></div>'
						+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response.tcode +'">%</span></div></div></div>'
						+'<div><div><span>시작 날짜 : '+response.tsdate+'</span></div><div><span>종료 날짜 : '+response.tedate+'</span></div><div class="bts">'
						+'<button style="border:0px;outline:none;color:white;background-color:#ed8151; margin-right:5px; font-size:12px;" class="btn" onclick= "privateCreate(\''+response.tsdate+ ',' +response.tedate+'\','+response.tcode+')" type="button">개인업무생성</button></div><div>'
						+'</div></div></div></div>';
						} 
						$("#LV1").append($append);
						
						var a = $("#chart"+response.tcode.toString());
						var percent = parseInt(a.data('percent'));
						var deg = 360 * percent / 100;
							if (percent > 50) {
								a.addClass("gt-50");
							}
						var b=$("#fill"+response.tcode.toString());
						b.css('transform', 'rotate(' + deg + 'deg)');
						$('#num'+response.tcode.toString()).html(percent + '%');
						
			} else {
				alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	
});


 //최상위 업무로 이동
 function goroottask(pcode){
 	$("#publictaskBOTTOM").load("/project/publicTask/downTask?tcode="+ <%=tcode%>); 
 }
 
 function gotasklist(pcode){
	 location.href='/project/publicTask/main/?pcode='+pcode;
 }
 
 //업무 클릭시 div를 인식해서 유동적으로 조회 해야하는데...
 function downtasklist(tcode, curLv){
	 event.stopPropagation();
	 var downLv = parseInt(curLv.substr(2)) + 1;
	 alert(downLv);
	 $("#"+curLv).nextAll().remove();
	 $.ajax({
			type : 'GET',
			url : '/publictask/down/'+ tcode,
			success : function(response) {
				if (response.length > 0) {
					$cppend='<div style="width:24%; margin-right:1%" id="LV'+downLv+'">LV'+downLv+'</div>';
					$("#publictaskBOTTOM").append($cppend);
					
					for(var i=0;i<response.length;i++){
						if(chatpermission=="OWNER"){
							var $bppend = '<div id="publictask'+response[i].tcode+'" style="margin-bottom:10px; height: 200px; background-color: white;" onclick="downtasklist('+response[i].tcode+', $(this).parent()[0].id)">'
							+'<div onclick="" style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response[i].tcolor+';"><span>'+ (i+1) +'. : '+response[i].ttitle+','+response[i].tcode+'</span></div>'
							+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
							+'<div style="margin-left:20px;" id="chart'+response[i].tcode+'" class="progress-pie-chart" data-percent="'+response[i].tpercent+'">'
							+'<div class="ppc-progress">'
							+'<div class="ppc-progress-fill" id="fill'+response[i].tcode+'"></div></div>'
							+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response[i].tcode +'">%</span></div></div></div>'
							+'<div><div><span>시작 날짜 : '+response[i].tsdate+'</span></div><div><span>종료 날짜 : '+response[i].tedate+'</span></div><div class="bts">'
							+'<button style="border:0px;outline:none;color:white;background-color:#ed8151;font-size:12px; margin-right:5px;" class="btn" type="button" onclick="downtaskcreate(\''+response[i].tsdate+ ',' +response[i].tedate+'\','+response[i].tcode+')">하위업무생성</button>'
							+'<button style="border:0px;outline:none;color:white;background-color:#ed8151; font-size:12px; margin-right:5px;" class="btn" onclick= "ptedit(\''+response.tsdate+ ',' +response[i].tedate+'\','+response[i].tcode+')" type="button">수정</button>'
							+'<button style="border:0px;outline:none;color:white;background-color:#ed8151; font-size:12px;" class="btn" type="button" onclick="ptdel('+response[i].tcode+')">삭제</button></div></div></div></div>';
						}
						
						else if(chatpermission=="MEMBER"){
							var $bppend = '<div id="publictask'+response[i].tcode+'" style="margin-bottom:10px; height: 200px; background-color: white;" onclick="downtasklist('+response[i].tcode+', $(this).parent()[0].id)">'
							+'<div onclick="" style="cursor:pointer; width: 100%; height: 20%; border:3px solid #'+response[i].tcolor+';"><span>'+ (i+1) +'. : '+response[i].ttitle+','+response[i].tcode+'</span></div>'
							+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
							+'<div style="margin-left:20px;" id="chart'+response[i].tcode+'" class="progress-pie-chart" data-percent="'+response[i].tpercent+'">'
							+'<div class="ppc-progress">'
							+'<div class="ppc-progress-fill" id="fill'+response[i].tcode+'"></div></div>'
							+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+ response[i].tcode +'">%</span></div></div></div>'
							+'<div><div><span>시작 날짜 : '+response[i].tsdate+'</span></div><div><span>종료 날짜 : '+response[i].tedate+'</span>'
							+'</div></div><div class="bts"><button style="border:0px;outline:none;color:white;background-color:#ed8151; margin-right:5px; font-size:12px;" class="btn" onclick="privateCreate(\''+response[i].tsdate+ ',' +response[i].tedate+'\','+response[i].tcode+')" type="button">개인업무생성</button><div></div></div></div></div>';
						}
						
						$("#LV"+downLv).append($bppend);
						var c = $("#chart"+response[i].tcode.toString());
						var percent = parseInt(c.data('percent'));
						var deg = 360 * percent / 100;
						if (percent > 50) {
							c.addClass("gt-50");
							}
						var d=$("#fill"+response[i].tcode.toString());
						d.css('transform', 'rotate(' + deg + 'deg)');
						$('#num'+response[i].tcode.toString()).html(percent + '%'); 
							
						}
				}else{
					alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
			
		});
 }
</script>