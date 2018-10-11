<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script  src="${pageContext.request.contextPath }/resources/js/task/jscolor.js"></script>
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
	String mcode=request.getParameter("mcode");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
	
var pcode=<%=pcode%>;
var mcode=<%=mcode%>;
</script>
</head>

<body>
<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">방법론을 이용한 공용 업무 생성을 환영합니다.</h4>
					<button onclick="gomethodlists()" type="button" class="btn" style="outline:none;color:white;background-color:#ed8151;border:0px;">방법론 리스트로 이동하기</button>
				</div>
				<div class="modal-body">
				 	<div class="form-group">
						<label>방법론 리스트</label> 
					</div>
					
					<div id="methodlistss">
						<input id="pttitle" type="text"	class="form-control" maxlength="20">
						<p style="margin-top:20px;"> 공용업무 색상: <input class="jscolor" onchange="update(this.jscolor)" value="" style="width:60px;"> </p>	 
							
						<div>
								시작날짜: <input class="form-control" type="text" id="psdate">
						</div>
							
						<div>
								종료날짜: <input class="form-control" type="text" id="pedate">
						</div>
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
var mycolor="";
var fixpsdate='<%=tsdate%>';
var fixpedate='<%=tedate%>';
$(function() {
	// method item list 불러오기
	$.ajax({
		type : 'GET',
		url : '/methoditem/'+mcode,
		success : function(response) {
			if (response.length > 0) {
				alert('method item list 조회 완료');
				for(var i=0;i<response.length;i++){
					$div='<button type="button" class="btn" style="outline:none;color:white;background-color:#ed8151;border:0px;margin-right: 10px; ">'+response[i].misequence+'. '+response[i].mititle+'</button>';
					$(".form-group").append($div);
				}
			} else  {
				alert('Server or Client ERROR, method item list 조회 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	
	
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
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$('#psdate').datepicker();
	$("#psdate").datepicker("option", "minDate", fixpsdate);
	$('#psdate').datepicker("option", "maxDate", fixpedate);
	$('#psdate').datepicker("option", "onClose", function(selectDate) {
	$("#pedate").datepicker("option", "minDate", selectDate);
	});

	$('#pedate').datepicker();
	$("#pedate").datepicker("option", "minDate", fixpsdate);
	$("#pedate").datepicker("option", "maxDate", fixpedate);
	$('#pedate').datepicker("option", "onClose", function(selectDate) {
	$("#psdate").datepicker("option", "maxDate", selectDate);
	});
	
	//stomp
	var socket = new SockJS('/goStomp'); 
	stompClient = Stomp.over(socket);
});


function update(jscolor) {
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
	//공용 업무 생성 
	var param = {
		'ttitle' : $("#pttitle").val(),
		'tcolor' : mycolor,
		'tsdate' : $("#psdate").val(),
		'tedate' : $("#pedate").val(),
		'trefference' : null,
		'pcode' : pcode
	};
	$.ajax({
		type : 'POST',
		url : '/publictask',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response > 0) {
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
	});
}

function gomethodlists(){
	var screenW = screen.availWidth;  
	var screenH = screen.availHeight; 
	var posL=( screenW-popW ) / 2;   
	var posT=( screenH-popH ) / 2; 
	var popW = 500; 
	var popH = 400; 
	window.open("/project/method/publicTask/create?tsdate="+fixpsdate+"&tedate="+fixpedate+"&pcode="+pcode+"&mcode="+mcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
	window.close();
}
	
</script>
</html>