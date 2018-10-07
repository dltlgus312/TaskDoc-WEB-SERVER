<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String tcode=request.getParameter("tcode");
%>
<div id="LV1" style="width:200px;">
LV1
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#publictaskList").css('display','-webkit-box');
	$.ajax({
		type : 'GET',
		url : '/publictask/publicTaskView/' + <%=tcode%>,
		success : function(response) {
			if (Object.keys(response).length > 0) {
				var $plist='<div onclick="downtasklist('+response.tcode+', $(this).parent()[0].id)" id="ptask'+response.tcode+'"'
				+'style="width:120px;height:120px; border: 1px solid #ed8151; margin-right:20px; margin-top:20px; float:left;">'
				+'<div style="width:100%;height:80%; cursor:pointer;"><img src="${pageContext.request.contextPath }/resources/img/img_filetask.png"style="width:100%;height:100%;"></div>'
				+'<div style="width:100%;height:20%; text-align:center;cursor:pointer; border-top:1px solid #ed8151;" onclick="gofileView('+response.tcode+')">'+response.ttitle+'</div></div>';
				$("#LV1").append($plist);
			} else {
				alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
});

//파일 모아보기 탭 메뉴로이동 root 
function goroot(pcode){
	location.href='/project/file/main/?pcode='+pcode;
}

//업무 클릭시 div를 인식해서 유동적으로 조회 해야하는데...
function downtasklist(tcode, curLv){
	 var downLv = parseInt(curLv.substr(2)) + 1;
	 $("#"+curLv).nextAll().remove();
	 $.ajax({
			type : 'GET',
			url : '/publictask/down/'+ tcode,
			success : function(response) {
				if (response.length > 0) {
					$cppend='<div style="width:200px;" id="LV'+downLv+'">LV'+downLv+'</div>';
					$("#publictaskList").append($cppend);
					
					for(var i=0;i<response.length;i++){
						var $bppend = '<div onclick="downtasklist('+response[i].tcode+', $(this).parent()[0].id)" id="ptask'+response.tcode+'" style="width:120px;height:120px; border: 1px solid #ed8151; margin-right:20px; margin-top:20px; float:left;">'
						+'<div style="width:100%;height:80%; cursor:pointer;"><img src="${pageContext.request.contextPath }/resources/img/img_filetask.png"style="width:100%;height:100%;"></div>'
						+'<div style="width:100%;height:20%; text-align:center;cursor:pointer; border-top:1px solid #ed8151;" onclick="gofileView('+response[i].tcode+')">'+response[i].ttitle+'</div></div>';
						$("#LV"+downLv).append($bppend);
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