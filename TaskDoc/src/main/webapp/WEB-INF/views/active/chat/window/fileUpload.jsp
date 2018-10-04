<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode=request.getParameter("pcode");
	String crcode=request.getParameter("crcode");
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
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
		<div class="container">
			<div class="row">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">자료를 업로드 해주세요!</h4>
					</div>
						<div class="modal-body">
							<div class="form-group">
								<label>자료 제목</label> <input name="dmtitle" type="text" class="form-control" maxlength="20">
								<label style="margin-top:10px;">자료 설명</label> <textarea name="dmcontents" class="form-control"></textarea>
							</div>
		
							<div class="btn-group">
								<div>
									<label>자료를 업로드  할 공용업무를 선택해주세요</label>
									<select class="form-control" id="whattask">
									</select>
								</div>
								
								<div>
									<label style="margin-top :10px;">파일을 업로드 해주세요</label>
									<input type="file" name="file">
								</div>
							</div>
		
							
							<div class="modal-footer">
								<input id="btnSubmit" type="submit" class="btn" style="background-color:#ed8151;color:white;" value="생성">
								<button type="button" class="btn"
									onclick="decisionCancel()" style="background-color:#ed8151;color:white;">
									 Cancel
								</button>
							</div>
						</div>
					
				</div>
			</div>
		</div>
		
		<!--hidden값   -->
		<div style="display:none;">
			<input type="text" name="crcode" id="crcode">
			<input type="text" name="tcode" id="tcode">
			<input type="text" name="uid" id="uid">
		</div>
	
	</form>
</body>

<script type="text/javascript">
$(function(){
 $.ajax({
		type : 'GET',
		url : '/publictask/' + <%=pcode%>,
		success : function(response) {
			if (response.length != 0) {
				for(var i=0;i<response.length;i++){
					$whattask='<option value="'+response[i].tcode+'">'+ (i+1 )+'.' +response[i].tcode+ response[i].ttitle + '</option>';
					$("#whattask").append($whattask);
				}
				alert('공용업무 리스트 불러오기 성공!');
			} else if (response.length == 0) {
				alert('Server or Client ERROR, 공용업무 리스트 불러오기 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	}); 
	$("#btnSubmit").click(function (event) {
		$("#crcode").val(<%=crcode%>);
		$("#tcode").val($("#whattask option:selected").val());
		$("#uid").val(id);

		event.preventDefault();
        
		var form = $('#fileUploadForm')[0];
        var data = new FormData(form);

        $("#btnSubmit").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/document/upload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
            	alert("complete");
                $("#btnSubmit").prop("disabled", false);
            },
            error: function (e) {
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);
                alert("fail");
            }
        });

    });
});
</script>

</html>