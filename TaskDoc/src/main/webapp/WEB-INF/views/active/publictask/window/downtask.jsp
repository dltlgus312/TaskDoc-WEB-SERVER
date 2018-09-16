<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs




<script type="text/javascript">
/* $(document).ready(function() {
	//특정 프로젝트의 모든 공용업무를 보여준다.
	$.ajax({
		type : 'GET',
		url : '/publictask/' + pcode,
		success : function(response) {
			if (response.length != 0) {
				for(var i=0;i<response.length;i++){
					if(response[i].tsdate!=null && !response[i].tedate!=null){
						var $append = '<div id="publictask'+i+'" style="float: left; width: 24%; margin-right:1%; margin-bottom:10px; height: 200px; background-color: white;">'
						+'<div style="width: 100%; height: 20%; border:3px solid #'+response[i].tcolor+';"><span>'+i+'. : '+response[i].ttitle+'</span></div>'
						+'<div style="width: 100%; height: 80%; border:1px solid #ed8151; border-top:none;">'
						+'<div id="chart'+i+'" class="progress-pie-chart" data-percent="51" onclick="test('+i+')">'
						+'<div class="ppc-progress">'
						+'<div class="ppc-progress-fill" id="fill'+i+'"></div></div>'
						+'<div class="ppc-percents"><div class="pcc-percents-wrapper"> <span id="num'+i+'">%</span></div></div></div>'
						+'<div><div><span>시작 날짜 : '+response[i].tsdate+'</span></div><div><span>종료 날짜 : '+response[i].tedate+'</span></div><div><button type="button">수정</button><button type="button" onclick="ptdel('+response[i].tcode+')">삭제</button></div></div></div></div>';
					
						$("#publictaskBOTTOM").append($append);
						
						var a = $("#chart"+i.toString());
						var percent = parseInt(a.data('percent'));
						var deg = 360 * percent / 100;
							if (percent > 50) {
								a.addClass("gt-50");
							}
						var b=$("#fill"+i.toString());
						b.css('transform', 'rotate(' + deg + 'deg)');
						$('#num'+i.toString()).html(percent + '%');
					}
				}
			} else if (response.length == 0) {
				alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});

	
});

 function test(i) {
	var b = $("#chart"+i.toString());
	
	// 숫자만인지 체크하는 정규식
	var regNumber = /^[0-9]*$/;
	
	var test = prompt("퍼센트를 입력해주세요", "숫자만 입력해주세요");
	if (test > 100 || !regNumber.test(test)) {
		alert('100을넘거나 숫자 이외의 문자는 사용할 수 없습니다.');
	} else if(test<=100){
		percent = parseInt(test);
		deg = 360 * percent / 100;
		if (percent > 50) {
			b.addClass("gt-50");
			$("#chart"+i.toString()).css("background-color","#ed8151");
			$("#fill"+i.toString()).css('background','#e5e5e5');
		}
		else{
			b.removeClass("gt-50");
			$("#chart"+i.toString()).css("background-color",'#e5e5e5');
			$("#fill"+i.toString()).css('background','#ed8151');
		}
		$('#fill'+i.toString()).css('transform', 'rotate(' + deg + 'deg)');
		$('#num'+i.toString()).html(percent + '%');
	} 
}
 
 function ptcreate(pcode){
	 var screenW = screen.availWidth;  // 스크린 가로사이즈
		var screenH = screen.availHeight; // 스크린 세로사이즈
		var popW = 400; // 띄울창의 가로사이즈
		var popH = 400; // 띄울창의 세로사이즈
		var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
		var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
		window.open("/project/publicTask/create?pcode="+pcode,"", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no'); 
 }
 
 function ptdel(tcode){
	 if(confirm('업무를 삭제하시겠습니까?')=true){
	// 공용업무 삭제
		$.ajax({
			type : 'DELETE',
			url : '/publictask/' + tcode,
			success : function(response) {
				if (response == 1) {
					alert('공용업무 삭제 성공!');
					location.reload();
				} else if (response == -1) {
					alert('Server or Client ERROR, 공용업무 삭제 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	 }
	 else return;
 } */
</script>

</html>