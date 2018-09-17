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
					<div  class="bts" style="width: 100%; margin-top: 10px;">
						<span>공용업무 제목</span> <input id="pttitle"
							style="width: 80%; margin-top: 5px;" type="text"
							class="form-control" maxlength="20">
					</div>
					
					<div  class="bts" style="width: 100%; margin-top: 10px;">
						<span>색상</span> <input id="ptcolor"
							style="width: 80%; margin-top: 5px;" type="text"
							class="form-control" maxlength="255">
					</div>
					
					<div class="bts" style="width: 100%; margin-top: 10px;">
						<span>시작날짜</span> <input id="ptsdate" class="form-control"
							style="width: 80%; margin-top: 5px;" type="text">
					</div>
					
					<div  class="bts" style="width: 100%; margin-top: 10px;">
						<span>종료날짜</span> <input id="ptedate" class="form-control"
							style="width: 80%; margin-top: 5px;" type="text">
					</div>
					
					<div  class="bts" style="width: 100%; margin-top: 10px;">
						<span>진행도</span> <input id="ptpercent" class="form-control"
							style="width: 80%; margin-top: 5px;" type="text">
					</div>
					
					<div  class="bts" style="width: 100%; margin-top: 10px;">
						<span>참조</span> <input id="ptrefference" class="form-control" readonly="readonly"
							style="width: 80%; margin-top: 5px;" type="text">
					</div>
					
					<div  class="bts" style="width: 100%; margin-top: 10px;">
						<span>순서</span> <input id="ptsequence" class="form-control" readonly="readonly"
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
		</div>
	</div>
</body>

<script type="text/javascript">
//공용업무 정보받아오기
$(document).ready(function() {
	$.ajax({
		type : 'GET',
		url : '/publictask/publicTaskView/'+<%=tcode%>,
		success : function(response) {
			if (Object.keys(response).length>0) {
				alert('공용업무 조회 완료!');
				$("#pttitle").val(response.ttitle);
				$("#ptcolor").val(response.tcolor);
				$("#ptsdate").val(response.tsdate);
				$("#ptedate").val(response.tedate);
				$("#ptpercent").val(response.tpercent);
				$("#ptsequence").val(response.tsequence);
				$("#ptrefference").val(response.trefference);
			} else {
				alert('Server or Client ERROR, 공용업무 조회 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
			}
	});
	
});
	 


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


//공용업무 수정.
function edit(){
/* re = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	if(re.test($("#pttitle").val())){
		alert('프로젝트 제목에 특수문자를 넣을 수 없 습ㄴ ㅣ 다!');
	}else{ */
		var param = {
			'ttitle' : $("#pttitle").val(),
			'tcolor' : $("#ptcolor").val(),
			'tsdate' : $("#ptsdate").val(),
			'tedate' : $("#ptedate").val(),
			'tpercent' : $("#ptpercent").val(),
			'trefference' : $("#ptrefference").val(),
			'tsequence' : $("#ptsequence").val(),
			'tcode' : <%=tcode%>
		};
		$.ajax({
			type : 'PUT',
			url : '/publictask',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response == 1) {
					alert('공용업무 수정 완료!');
					opener.location.reload();
				} else if (response == -1) {
					alert('Server or Client ERROR, 공용업무 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
				}
		});
	}
/* } */

</script>
</html>