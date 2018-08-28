/*TOOLTIP JS , HOVER JS */
var popupX = (window.screen.width / 2) - (500 / 2);
var popupY= (window.screen.height /2) - (400 / 2);
var id='<%=loginid%>';

//가입된 프로젝트수
var proOk=0;

//초대받은 프로젝트수, 가입x
var proNo=0;

//가입된 프로젝트 표시할 div수
var proOkLine=0;

//초대받은 프로젝트 표시할 div수
var proNoLine=0;

$(document).ready(function() {
	/* 내가 참가하는 모든 프로젝트를 검색*/
	$.ajax({
		type : 'GET',
		url : '/projectjoin/' + id,
		success : function(response) {
			/*
			response는 map 형태로 날라옴
			프로젝트 결과 값 = map ( KEY = "projectList", "projectJoinList" )
			프로젝트에 소속되어있는 정보들
			projectJoinList{
				pcode;
			 	uid;
			 	ppermission;
			 	pinvite;
			}
			프로젝트들의 정보
			projectList{
				pcode;
				ptitle;
				psubtitle;
				psdate;
				pedate;	
			}
			pcode별로 프로젝트 list 나열하고, 프로젝트별 title, subtitle, psdate, pedate 설정하기
			 */
			/*ㅇㅇ*/
			/*가입된 프로젝트와 초대 받은 프로젝트 갯수구하기*/
			for(var i=0;i<response.projectJoinList.length;i++){
				if(response.projectJoinList[i].pinvite>0){
					proOk++;
					if(proOk%4!=0){proOkLine=parseInt(proOk/4)+1;}
					else{proOkLine=parseInt(proOk/4);}
				}
				else{
					proNo++;
					if(proNo%4!=0){
						proNoLine=parseInt(proNo/4)+1;
					}
					else{
						proNoLine=parseInt(proNo/4);
					}
				}
			}
			for(var i=0;i<proOkLine;i++){
				/*var $div=$('<div class="project_listdiv_wrap"'+'id=list'+i+'>'+'</div>');
				$("#project_list_wrap_top").append($div);
				var $div2=$('<div class="project_list"><div class="project_list_content_wrap"><div class="project_list_content_header"><div class="project_list_content_header_left"></div> <div class="project_list_content_header_right"></div></div><div class="project_list_content_bottom"><div class="project_list_subtitle"><span> 하이 </span></div><div class="project_list_start">START</div><div class="project_list_end">END</div><div class="project_list_position">직책</div></div></div></div></div>');
				$("#list"+i).append($div2);*/
				
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/* /내가 참가하는 모든 프로젝트를 검색*/
	
	/* 프로젝트에 초대받은사람 수락할때  
	 * projectjoin_SQL 다시알아보기★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	 */
	/*var param = {
		'pcode' : '현재 PCODE',
		'uid' : '현재 수락할 ID',
		'ppermission' : 'MEMBER',
		'pinvite' : 1
	};
	$.ajax({
		type : 'PUT',
		url : 'projectjoin',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('초대 수락 완료!');
			} else {
				alert('Server or Client ERROR, 초대 수락  실패!');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});*/
	/*/프로젝트에 초대받은사람 수락할때 */
});

//프로젝트별 setting 이미지 누르면 세팅으로 윈도우창띄어라
function prosettingopen(pcode){
	window.open("/project/infoEdit?pcode="+pcode,"", "height=400, width=600, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY); 
}

//프로젝트별 초대 이미지 누르면 초대로 윈도우창띄어라
function proinviteopne(id){
	window.open("/project/userInvite?pcode="+pcode,"", "height=400, width=600, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY); 
}




