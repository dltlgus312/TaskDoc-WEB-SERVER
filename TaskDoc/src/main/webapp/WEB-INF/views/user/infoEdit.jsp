<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/user/join.css?ver=54" />
</head>

<%
String loginid="";
loginid=(String)session.getAttribute("loginid");
String paramId=request.getParameter("id");
%>
<script type="text/javascript">
var id='<%=loginid%>';
if(id=="null"){
	alert('로그인이 필요한 페이지입니다.');
	window.location.href='/';
}
</script>

<body>
	<div>
		<div class="container" style="width: 600px; margin-top: 10px;">
			<div class="row">
				<div class="modal-content">

					<div class="modal-header"
						style="background: white; border-bottom: 1px solid gainsboro">
						<h4 class="modal-title">회원 정보 수정</h4>
					</div>
					<div class="modal-body">

						<!-- 아이디 입력 -->
						<div class="form-group">
							<label>아이디</label>
							<div style="display: -webkit-box;">
								<input id="uid" style="width: 80%;" type="text"
									class="form-control" readonly="readonly">
							</div>
						</div>
						<!-- /아이디 입력 -->

						<!-- 비밀번호 입력 -->
						<div class="form-group">
							<label>비밀번호</label> <input id="upasswd" style="width: 80%;"
								type="password" class="form-control" readonly="readonly">
						</div>
						<!-- /비밀번호 입력 -->

						<!-- 이름 입력 -->
						<div class="form-group">
							<label>이름</label> <input id="uname" style="width: 80%;"
								type="text" class="form-control">
						</div>
						<!-- /이름 입력 -->

						<div class="form-group">
							<label>상태메시지</label> <input id="ustate" style="width: 80%;"
								type="text" class="form-control">
						</div>

						<!-- 휴대폰 번호입력 -->
						<div class="form-group">
							<label>휴대폰 번호</label> <input id="uphone" style="width: 80%;"
								type="text" class="form-control"> <span
								class="help-block">휴대폰 번호(' - '는 빼주세요)를 입력 해주세요.</span>
						</div>
						<!-- /휴대폰 번호입력 -->
					</div>

					<div class="modal-footer">
						<span class="help-block">TASKDOC (은)는 개인정보 방침을 준수합니다.</span>
						<div style="float: left">
							<button type="button" style="font-size: 13px; background:"
								class="btn btn-success" onclick="userdel()">회원탈퇴</button>
						</div>
						<div>
							<button type="button" class="btn btn-success" onclick="edit()"
								style="font-size: 13px; margin: auto 0; margin-left: 6px;">Edit</button>
							<button type="button" style="font-size: 13px;"
								class="btn btn-success" onclick="cancel()">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
var savepasswd="";
$(document).ready(function(){
	/*회원 정보 수정을위해 정보를 불러오기*/
		$.ajax({
			type : 'GET',
			url : '/userinfo/' + '<%=paramId%>',
			success : function(response) {
				//Object.keys(response).length --> 자바리턴값이 Object일때 Object 의 크기 구하는법
				if (Object.keys(response).length > 0) {
					alert('유저정보 조회완료');
					savepasswd=response.upasswd;
					$('#uid').val(response.uid);
					$('#upasswd').val(response.upasswd);
					$('#uname').val(response.uname);
					$('#ustate').val(response.ustate);
					$('#uphone').val(response.uphone);
				} else {
					alert('유저정보 조회 실패')
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	});
 /*/회원 정보 수정을위해 정보를 불러오기*/
	
 /* 회원 정보 수정 처리*/
	function edit() {
		var param = {
			'uid' : '<%=loginid%>',
			'upasswd':savepasswd,
			'uname' : $("#uname").val(),
			'ustate' : $("#ustate").val(),
			'uphone' : $("#uphone").val()
		};
		$.ajax({
			type : 'PUT',
			url : '/userinfo',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response >0) {
					alert('회원정보 수정 완료!');
				} else {
					alert('Server or Client ERROR, 회원정보 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}
	/*/회원 정보 수정 처리*/
 
	function userdel(){
		if(confirm("※회원 탈퇴를 하시겠습니까?")==true){
			$.ajax({
				type : 'DELETE',
				url : '/userinfo/' + '<%=loginid%>',
				success : function(response) {
					/* response 1 or -1
					 */
					if (response >0) {
						alert('회원  탈퇴 완료');
						window.location.href='/';
					} else {
						alert('Server or Client ERROR, 회원 탈퇴 실패');
					}
				},
				error : function(e) {
					alert("ERROR : " + e.statusText);
				}
			});
		}else{
			return;
		}
	}
	function cancel() {
		location.href = '/project/main';
	}
</script>
</html>