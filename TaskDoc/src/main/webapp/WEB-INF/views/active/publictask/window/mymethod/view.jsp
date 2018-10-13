<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/task/jscolor.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode=request.getParameter("pcode");
	String tsdate=request.getParameter("tsdate");
	String tedate=request.getParameter("tedate");
	String mbcode=request.getParameter("tedate");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
	
var pcode=<%=pcode%>;
var mbcode=<%=pcode%>;
</script>
</head>

<body>
<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">나의 방법론을 이용한 공용 업무 생성을 환영합니다.</h4>
					<button onclick="gomymethodlist()" type="button" class="btn" style="outline:none;color:white;background-color:#ed8151;border:0px;">내 방법론 리스트로 이동하기</button>
				</div>
				<div class="modal-body">
				 	<div class="form-group">
						<label>방법론 리스트</label> 
					</div>
					
					<div id="methodlistss">
					</div>  
					
					<div class="modal-footer">
						
						<button type="button" class="btn btn-success btn-icon" style="outline: none;border:0px;background-color:#ed8151;color:white;"
							onclick="ptCreate()">
							<i class="fa fa-check"></i> Create PublicTask
						</button>
						
						<button type="button" class="btn btn-default btn-icon" style="outline: none;border:0px;background-color:#ed8151;color:white;"
							onclick="Cancel()">
							<i class="fa fa-times-circle"></i> Cancel
						</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
var socket = new SockJS('/goStomp'); 
stompClient = Stomp.over(socket);
var mycolor="";
var fixpsdate='<%=tsdate%>';
var fixpedate='<%=tedate%>';

//tsdate!=null tedate!=null인 array 담기
var parrays=new Array();

//정렬된 array
var realplist=new Array();

$(function() {
	$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
					'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)', '9월(SEP)',
					'10월(OCT)', '11월(NOV)', '12월(DEC)' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : '',
			changeMonth : true,
			changeYear : true,
			showButtonPanel : false,
			yearRange : 'c-99:c+99',
			minDate : fixpsdate,
			maxDate : fixpedate 
			};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	// method item list 불러오기
	$.ajax({
		type : 'GET',
		url : '/publictask/'+pcode,
		success : function(response) {
			if (response.length > 0) {
				alert('public list 조회 완료');
				for(var i=0;i<response.length;i++){
					if(response[i].tsdate!=null && response[i].tedate!=null){
						parrays=response[i];
					    goSort(parrays);
					}
				}
				listmake();
			}
			else  {
				alert('Server or Client ERROR, method item list 조회 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	
	var cnt=0;
	var ccnt=0;
	//정렬하는 함수
	function goSort(parrays){
		// 최상단 이라면 그냥 추가 하고 리턴..
        if (parrays.tcode == parrays.trefference) {
            realplist.push(parrays);
            cnt++;
            console.log(cnt);
            return;
        }
	
        // 같은걸 참조하는 동급 업무중 순서도(시퀀스) 가 제일큰 업무 찾기
        var max = null;
        for (var i=0;i<realplist.length;i++) {
            if (realplist[i].trefference == parrays.trefference) {
                max = realplist[i];
            }
        }
	 
        // 찾지 못했다면 부모를 찾아서 부모 바로 아래에 추가..
        if (max == null) {
            for (var j=0;j<realplist.length; j++) {
                if (realplist[j].tcode == parrays.trefference) {
                    realplist.splice(j+1,0,parrays);
                    console.log(realplist);
                    return;
                }
            }
        }
	
        // 찾았다면 그의 자식이 있는지 재귀함수로 찾는다..
        else {
        	var chMax=null;
            chMax = findMaxTask(max, realplist);
            if (chMax == null) realplist.splice(realplist.indexOf(max) + 1, 0 , parrays);
            else realplist.add(realplist.indexOf(chMax) + 1, 0 , max);
        }  
	}
	
	//정렬하는 재귀 함수
	function findMaxTask(vo, list){
		var max=null;
		var chMax=null;
		
		for (var i=0;i<list.length;i++) {
	       if (vo != list[i] && vo.tcode == list[i].trefference) {
	             max = list[i];
	         }
	     }
	       if (max != null) {
	    	   chMax = findMaxTask(max, list);
	          if (chMax == null) return max;
		        else return chMax;
		   }
	       console.log(cnt+"-");
	       return null; 
	} 
	
	function listmake(){
		//for문으로 업무생성
		 for(var i=0;i<realplist.length;i++){
				$div='<button type="button" class="btn" style="margin-top:20px; outline:none;color:white;background-color:#ed8151;border:0px;margin-right: 10px; ">'+realplist[i].tcode+'. '+realplist[i].ttitle+'</button>'
				+'<input placeholder="공용 업무 제목을 입력해주세요." id="pttitle'+realplist[i].tcode+'" type="text"	class="form-control" maxlength="20">'
				+'<p style="margin-top:20px;"> 공용업무 색상: <input id="color'+realplist[i].tcode+'"class="jscolor" onchange="update(this.jscolor,'+realplist[i].tcode+')" value="" style="width:60px;"> </p>'
				+'<div>시작날짜: <input class="hasDatepicker" type="text" name="cAcqDate" id="psdate'+realplist[i].tcode+'"><div>'
				+'<div>종료날짜: <input class="hasDatepicker" type="text" name="cAceDate" id="pedate'+realplist[i].tcode+'"></div>';
				$("#methodlistss").append($div);
				
				$("#psdate"+realplist[i].tcode).removeClass('hasDatepicker').datepicker();
				$("#pedate"+realplist[i].tcode).removeClass('hasDatepicker').datepicker();
				
				
				$("#psdate"+realplist[i].tcode).datepicker();
				
				$("#psdate"+realplist[i].tcode).datepicker("option", "onClose", function(selectDate) {
					if(selectDate != "") {
						$("#pedate"+this.id.substr(length-1)).datepicker("option", "minDate", selectDate);
					}
				}); 
			
				$("#pedate"+realplist[i].tcode).datepicker();
				
				$("#pedate"+realplist[i].tcode).datepicker("option", "onClose", function(selectDate) {
					if(selectDate != "") {
						$("#psdate"+this.id.substr(length-1)).datepicker("option", "maxDate", selectDate);
					}
				}); 
		}
		jscolor.installByClassName("jscolor"); 
	}
});


function update(jscolor,code) {
	alert(code);
    // 'jscolor' instance can be used as a string
    $("#rect").css('background-color','#'+jscolor);
    var removeData='#'+jscolor;
    //#제거
    mycolor=removeData.replace("#","");
}
 
function Cancel(){
	window.close();
} 
function ptCreate(){
	
	var list=new Array();
	var obj=new Object();
	for(var i=0; i<realplist.length; i++){
		obj.ttitle = $("#pttitle"+realplist[i].tcode).val();
		obj.tcolor = $("#color"+realplist[i].tcode).val();
		obj.tsdate = $("#psdate"+realplist[i].tcode).val();
		obj.tedate = $("#pedate"+realplist[i].tcode).val();
		obj.tsequence = realplist[i].tsequence;
		obj.trefference = realplist[i].trefference;
		obj.pcode=parseInt(<%=pcode%>);
		list.push(obj);
		obj=new Object();
	}
	
	//전송
	$.ajax({
		type : 'POST',
		url : '/publictask',
		contentType : 'application/json',
		data : JSON.stringify(list),
		success : function(response) {
			if (response.length > 0) {
				alert('공용업무 생성 완료! 프로젝트의 공용업무의 id값은' + response);
				
				//stomp 서버전송
				var peram={
						 'message' : 'insert',
						 'type' : 'publictaskvo',
						 'object' :{
								 'ttitle' : $("#pttitle").val(),
								 'tcolor' :  mycolor,
							 	 'tsdate' : $("#psdate").val(),
								 'tedate' : $("#pedate").val(),
								 'tpercent' : 0,
								 'trefference' : response,
								 'pcode' : pcode,
								 'tcode' : response
							}
					 };
					stompClient.send('/app/project/'+pcode, {},JSON.stringify(peram));
					window.close();
					
			} else  {
				alert('Server or Client ERROR, 공용업무 생성 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	})
}

function gomymethodlist(){
	var screenW = screen.availWidth;  
	var screenH = screen.availHeight; 
	var posL=( screenW-popW ) / 2;   
	var posT=( screenH-popH ) / 2; 
	var popW = 500; 
	var popH = 400; 
	window.open("/project/mymethod/publicTask/create?tsdate="+fixpsdate+"&tedate="+fixpedate+"&mbcode="+mbcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
	window.close();
}
	
</script>
</html>