$(document).ready(function(){
	//prouser Object list에 담을라고만듦sssfe
	var prouserlist=new Array();
	
	//display 화면 비율 조정
		var contentheight = $("#contentwrap").height();
		var contentwidth = $("#contentwrap").width();
		$(".container").css('height', contentheight);
		$(".container").css('width', contentwidth / 1.1);
		
		var line_height = $("#proheader").height();
		//TOP MENU, TITLE, LOGO들 LINE-HEIGHT 설정
		$("#prochatbtn1").css('line-height',line_height+"px");
		$("#prochatbtn2").css('line-height',line_height+"px");
		$(".chat_hover").css('line-height',line_height+"px");
		$(".gantt_hover").css('line-height',line_height+"px");
		$(".ptask_hover").css('line-height',line_height+"px");
		$(".files_hover").css('line-height',line_height+"px");
		$("#pro_title").css('line-height',line_height+"px");
		
		//프로젝트에 포함된 유저 리스트불러와라
		 $.ajax({
				type : 'GET',
				url : '/projectjoin/collaboration/'+pcode,
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
					for(var j=0;j<prouserlist.length;j++){
							var $atag='<li><a href="#">'+prouserlist[j].ppermission+' : '+prouserlist[j].uid+'</a></li>';
							$("#propeoplelist").append($atag);
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		 
		//해당 id에 대한 모든 프로젝트 정보와, 해당프로젝트에 가입된 나의정보, 권한으로 setting버튼놔둘지, 공지사항버튼놔둘지 .. 추후에 
		 //psdate와 pedate저장해서 . 업무 생성시 mindate와 maxdate설정할것
		 $.ajax({
				type : 'GET',
				url : '/projectjoin/'+ id,
				success : function(response) {
					for(var j=0; j<response.projectJoinList.length;j++){
						if(response.projectJoinList[j].pcode==pcode &&response.projectJoinList[j].pinvite==1){
							if(response.projectJoinList[j].ppermission=="OWNER"){
								
								var $stag='<button id="prochatbtn3" onclick="goproset('+pcode+')" type="button"style="height: 42px; float: right; outline: none; border: 0; background-color: white; width: 100%;">'
											+'<img src="/resources/img/img_boardsetting.png"alt="" style="width: 15px; height: 15px;"> <span>설정</span></button>';
								$("#setornotice").append($stag);
								$("#prochatbtn3").css('line-height',line_height+"px");
								$("#pro_title").html("프로젝트 명 : "+response.projectList[j].ptitle);
								
							}else if(response.projectJoinList[j].ppermission=="MEMBER"){
								var $ntag='<button id="prochatbtn3" onclick="gonotice('+pcode+')" type="button"style="height: 42px; float: right; outline: none; border: 0; background-color: white; width: 100%;">'
								+'<img src="/resources/img/img_notice.png"alt="" style="width: 15px; height: 15px;"> <span>공지</span></button>';
								$("#setornotice").append($ntag);
								$("#prochatbtn3").css('line-height',line_height+"px");
								$("#pro_title").html("프로젝트 명 : "+response.projectList[j].ptitle);

							}
						}
					}
					
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		 
		 
		 
		// TOP MENU 선택시 색깔변하게할려고
		 $(".chat_hover").on("click",function(){
			 $(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
			$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
		 });
		 
		 $(".ptask_hover").on("click",function(){
			$(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
			$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
		}); 
		 
		 $(".gantt_hover").on("click",function(){
			$(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
			$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".files_hover").css('color','#6d6d6d').css('border-bottom','none');
		}); 
		 
		 $(".files_hover").on("click",function(){
			$(this).css('color','#ed8151').css('border-bottom','1px solid #ed8151');
			$(".chat_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".gantt_hover").css('color','#6d6d6d').css('border-bottom','none');
			$(".ptask_hover").css('color','#6d6d6d').css('border-bottom','none');
		}); 
	});

	//view page에서 설정 버튼 누를때 나오는 페이지(OWNER)
	function goproset(pcode){
			 if(window.confirm('프로젝트 정보 수정  페이지를 띄우시겠습니까?')==true){
		    	 var screenW = screen.availWidth;  // 스크린 가로사이즈
		    	 var screenH = screen.availHeight; // 스크린 세로사이즈
		    	 var popW = 1000; // 띄울창의 가로사이즈
		    	 var popH = 800 // 띄울창의 세로사이즈
		    	 var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
		    	 var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
		    	 window.open("/project/infoEdit?pcode="+pcode,"",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
			}
			else
				return;
		}
	//view page에서 공지사항누를때 나오는 페이지(MEMBER)
	function gonotice(pcode){
		if(window.confirm('공지사항  페이지를 띄우시겠습니까?')==true){
			var screenW = screen.availWidth;  // 스크린 가로사이즈
			var screenH = screen.availHeight; // 스크린 세로사이즈
			var popW = 500; // 띄울창의 가로사이즈
			var popH = 500 // 띄울창의 세로사이즈
			var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
			var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
			window.open("/project/noticeMain?pcode="+pcode,"",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
		}
		else
			return;
	}
	
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
	