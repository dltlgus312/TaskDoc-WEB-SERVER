<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	String mcode=request.getParameter("mcode");   
 	String mcontents=request.getParameter("mcontents");   
 %>
<body>
	<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">메모 수정을 환영합니다.</h4>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
						<label>메모내용</label> 
						<textarea id="mcontents"class="form-control"><%=mcontents%></textarea>
					</div>
					
					<div class="modal-footer">
						
						<button type="button" class="btn btn-success btn-icon"
							onclick="memocreate()" style="background-color:#ed8151;color:white;border:0px;outline:noen;">
							Edit Memo
						</button>
						
						<button type="button" class="btn btn-default btn-icon"
							onclick="memoCancel()" style="background-color:#ed8151;color:white;border:0px;outline:noen;">
							Cancel
						</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function memocreate(){	
		var param = {
			'mcontents' : $("#mcontents").val(),
			'mcode' : <%=mcode%>
		};
		alert($("#mcontents").val());
		alert(<%=mcode%>);
		$.ajax({
			type : 'PUT',
			url : '/memo',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response>0) {
					alert('메모 수정 완료! 메모의 mcode값은' + response);
					location.href='/project/memo/main?ptcode='+ptcode;
				} else {
					alert('Server or Client ERROR, 메모 수정 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}
	function memoCancel(){
		location.href='/project/memo/main?ptcode='+ptcode;
	}
</script>
</html>