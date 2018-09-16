<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String tcode = request.getParameter("tcode");
%>


</head>
<body>
	<div class="container">
		<h2>공용업무 수정</h2>
		<p>공용업무를 수정해보세요</p>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<div class="main"
					style="border: 1px solid rgba(0, 0, 0, 0.2); box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5); background-color: white; display: contents;">
					<div id="2" class="bts" style="width: 100%; margin-top: 10px;">
						<span>프로젝트 제목</span> <input id="ptitle"
							style="width: 80%; margin-top: 5px;" type="text"
							class="form-control" maxlength="20">
					</div>
					<div id="3" class="bts" style="width: 100%; margin-top: 30px;">
						<span>프로젝트 부제목</span> <input id="psubtitle"
							style="width: 80%; margin-top: 5px;" type="text"
							class="form-control" maxlength="255">
					</div>
					<div id="4" class="bts" style="width: 100%; margin-top: 30px;">
						<span>시작날짜</span> <input id="psdate" class="form-control"
							style="width: 80%; margin-top: 5px;" type="text">
					</div>
					<div id="5" class="bts" style="width: 100%; margin-top: 30px;">
						<span>종료날짜</span> <input id="pedate" class="form-control"
							style="width: 80%; margin-top: 5px;" type="text">
					</div>
					<div id="7" style="width: 100%; margin-top: 30px;">
						<div class="bts" style="height: 70%; margin-top: 16px;">
							<button type="button" onclick="prodeldel()"
								style="margin-left: 7px; float: left; background-color: #ed8151; border: 0; outline: none;"
								class="btn btn-success">프로젝트 삭제하기</button>
							<button type="button"
								style="float: right; margin-right: 7px; background-color: #ed8151; border: 0; outline: none;"
								class="btn btn-success" onclick="cancel()">Cancel</button>
							<button type="button" class="btn btn-success" onclick="edit()"
								style="margin: auto 0; margin-left: 6px; float: right; margin-right: 7px; background-color: #ed8151; border: 0; outline: none;">Edit</button>
						</div>
					</div>
				</div>
			</div>
			<div id="menu1" class="tab-pane fade">
				<div class="containers">
					<table class="table table-striped table-hover">
						<thead id="theady">
							<tr>
								<th style="width: 5%; text-align: center;">체크</th>
								<th style="width: 8%; text-align: center;">초대상태</th>
								<th style="width: 15%; text-align: center;">아이디</th>
								<th style="width: 15%; text-align: center;">닉네임</th>
								<th style="width: 47%; text-align: center;">상태메시지</th>
								<th style="width: 10%; text-align: center;">권한</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="bts">
					<button type="button" onclick="byeproject()"
						class="btn btn-success"
						style="background-color: #ed8151; outline: none; border: 0">회원
						추방</button>
				</div>
			</div>

			<div id="menu2" class="tab-pane fade">
				<div class="containers">
					<div class="bts">
						<button type="button" onclick="makenotice()"
							class="btn btn-success"
							style="background-color: #ed8151; outline: none; border: 0">생성</button>
					</div>
					<table class="table table-striped table-hover">
						<thead id="theady2">
							<tr>
								<th style="width: 5%; text-align: center;">번호</th>
								<th style="width: 15%; text-align: center;">제목</th>
								<th style="width: 15%; text-align: center;">날짜</th>
								<th style="width: 15%; text-align: center;">관리</th>
							</tr>
						</thead>
					</table>
				</div>

			</div>
			<!-- <div id="menu3" class="tab-pane fade">
				<h3>Menu 3</h3>
			</div> -->
		</div>
	</div>
</body>

<script type="text/javascript">
var screenW = screen.availWidth;  // 스크린 가로사이즈
var screenH = screen.availHeight; // 스크린 세로사이즈
var popW = 600; // 띄울창의 가로사이즈
var popH = 350; // 띄울창의 세로사이즈
var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 

 
//프로젝트 수정시 datepicker api사용
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
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$('#psdate').datepicker();
	$("#psdate").datepicker("option", "minDate", 0);
	$('#psdate').datepicker("option", "maxDate", $("#toDate").val());
	$('#psdate').datepicker("option", "onClose", function(selectedDate) {
		$("#pedate").datepicker("option", "minDate", selectedDate);
	});

	$('#pedate').datepicker();
	$("#pedate").datepicker("option", "minDate", 0);
	$('#pedate').datepicker("option", "minDate", $("#psdate").val());
	$('#pedate').datepicker("option", "onClose", function(selectedDate) {
		$("#psdate").datepicker("option", "maxDate", selectedDate);
	});
});

//돌아가기
function cancel() {
	window.close();
}

//프로젝트 수정
function edit(){
	//특수문자
	re = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	if(re.test($("#ptitle").val())){
		alert('프로젝트 제목에 특수문자를 넣을 수 없 습ㄴ ㅣ 다!');
	}
	else{
	var param = {
				'pcode' : <%=pc%>,
				'ptitle' : $("#ptitle").val(),
				'psubtitle' : $("#psubtitle").val(),
				'psdate' : $("#psdate").val(),
				'pedate' : $("#pedate").val()
		};
		$.ajax({
			type : 'PUT',
			url : '/project',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response == 1) {
					alert('프로젝트 수정 완료!');
					
					//자식창에서 부모창 제어하기
					//chat/main
					$("#pro_title",opener.document).text("프로젝트 명 : "+$("#ptitle").val());
					//project/main
					$("#pro_titlename",opener.document).text($("#ptitle").val());
					$("#pro_subtitlename",opener.document).text($("#psubtitle").val());
					$("#pro_sdate",opener.document).text($("#psdate").val());
					$("#pro_edate",opener.document).text($("#pedate").val());

					//opener.location.reload();
				}
				else{
					alert('Server or Client ERROR, 프로젝트 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}
}

//공용업무 수정.
var param = {
	'ttitle' : '바꿀제목',
	'tcolor' : '바꿀색상',
	'tsdate' : '바꿀시작날짜',
	'tedate' : '바꿀끝날날짜',
	'tpercent' : '바꿀 퍼센터',
	'trefference' : '어느 업무를 참조하여 하위 공용업무로 바꿀것인가',
	'tsequence' : '바꿀 순서',
	'tcode' : '바꾸려고하는 업무의 TCODE'
};
$.ajax({
	type : 'PUT',
	url : 'publictask',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		if (response == 1) {
			alert('공용업무 수정 완료!');
		} else if (response == -1) {
			alert('Server or Client ERROR, 공용업무 수정 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});

//공용업무 정보받아오기
 $(document).ready(function() {
 });
	 

</script>
</html>