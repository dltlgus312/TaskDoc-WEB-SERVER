<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- BOOTSTRAP CSS, JS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- BOOTSTRAP CSS, JS -->

<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
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
	<div class="container">
		<div class="row">
			<div class="modal-content" style="width: 800px; margin: auto;">
				<div class="modal-header">
					<h4 class="modal-title">글 작성하기</h4>
				</div>
				<div class="modal-body">

					<!--제목 , 내용 div  -->
					<div class="form-group">
						<label>제목</label> <input id="mtitle" type="text"
							class="form-control" maxlength="20"> <label
							style="padding-top: 5px;">내용</label>
						<textarea class="form-control" rows="8" id="mcontent"></textarea>

						<div style="margin-top: 20px;" id="proselectOk">
							<button type="button" class="btn btn-default btn-icon"
								onclick="selectProject()" id="selectProject">프로젝트 선택하기
							</button>
						</div>
					</div>
					<!--제목 , 내용 div  -->

					<!-- button div  -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success btn-icon"
							onclick="boardCreate()">
							<i class="fa fa-check"></i> Create
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="boardCancel()">
							<i class="fa fa-times-circle"></i> Cancel
						</button>
					</div>
					<!-- button div  -->

				</div>
			</div>
		</div>
	</div>
</body>
<script>

//selectProject에서 받은 pcode의 값
var pcode=0;

var popupX = (window.screen.width / 2) - (500 / 2);
var popupY= (window.screen.height /2) - (400 / 2);

function boardCreate(){
	
	if(pcode!=0){
//게시글 작성하기
var param = {
			'mbtitle' : $("#mtitle").val(),
			'mbcontents' : $("#mcontent").val(),
			'pcode' : pcode,
			'uid' : '<%=loginid%>'
		};
		$.ajax({
			type : 'POST',
			url : '/methodboard',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response > 0) {
					alert('게시판 생성 완료! 게시판의 mbcode값은' + response);
					location.href='/methodBoard';
				} else {
					alert('Server or Client ERROR, 게시판 생성 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
		//게시판 생성시 프로젝트 리스트 받아와서 프로젝트를 추가후 게시판 등록해야함
		//게시글 작성하기
	}
	else{
		alert('프로젝트');
	}
}
	
	function boardCancel(){
		location.href='/methodBoard';
	}
	
	//프로젝트 선택할 window창 생성
	function selectProject(){
		window.open("BoardSelectProject?uid="+"<%=loginid%>","", "height=400, width=1000, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY); 
	}
	
	function completeProject(child_pcode){
		pcode=child_pcode;
		$("#selectProject").remove();
		var h3tag=document.createElement("h3");
		var h3ele=document.createTextNode("프로젝트 선택 완료!");
		h3tag.appendChild(h3ele);
		$("#proselectOk").append(h3tag);
	}
	
</script>
</html>