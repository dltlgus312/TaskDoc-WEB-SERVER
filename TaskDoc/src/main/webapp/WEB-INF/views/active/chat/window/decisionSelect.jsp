<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
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
	String dscode=request.getParameter("dscode");
	String dstitle=request.getParameter("dstitle");
	String dsdate=request.getParameter("dsdate");
	String permission=request.getParameter("permission");
%>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">의사결정 항목을 선택해주세요!</h4>
				</div>
					<div class="modal-body">
						<div class="form-group">
							<div>
								<label style="padding-top: 6px">제목 : <%=dstitle %></label>
							</div>
							
							<div>
								<label style="padding-top: 6px">날짜 : <%=dsdate %></label>
							</div>
							
							<div>
								<label style="padding-top: 6px">의사결정 문항</label>
								<div id="tableDiv" style="display: none;">
									<table class="table">
										<thead id="thead">
											<tr>
												<th>번호</th>
												<th>문항</th>
												<th>체크</th>
												<th>COUNT</th>
											</tr>
										</thead>
									</table>
								</div>

							</div>
							<h4 class="endhaha" style="color: red"></h4>
							<div></div>

						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="isEmpty">
						<button type="button" class="btn btn-default btn-icon"
							onclick="decisionEnd()" id="Endbtn">
							<i class="fa fa-times-circle"></i> 종료
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="choiceDecision()" id="Okbtn">
							<i class="fa fa-times-circle"></i> 선택하기
						</button>
						<button type="button" class="btn btn-default btn-icon"
							onclick="proCancel()">
							<i class="fa fa-times-circle"></i> Cancel
						</button>
					</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var decisionitemlist = [];
	
	var voterOk=false;
	
	$(document).ready(function() {
		/* 	종료는  type이 OWNER일 경우에만 가능
		 * 		if( 1-1 의사결정항목 조회)
		 *				if(1-3 본인이 투표를 했는지 안했는지 체크)
		 *						if(1-3-1 본인이 투표를했다면 -> 체크리스트, 투표하기버튼 잠금)
		 *						
		 *						else(1-3-2 본인이 투표를하지않았다면 -> 체크리스트, 투표하기버튼 활성화)
		 *    2.else(2-1 종료되었다면  종료버튼, 체크리스트 모두 잠금).
		 */
	$.ajax({
			type : 'GET',
			url : '/voter/check/'+<%=dscode%>,
			success : function(response) {
			
			//투표한 리스트
			var list={};
			list=response;	
			
			//리스트중 현재 아이디가 있으면 voterOk==true
			for(var i=0;i<list.length;i++){
				if(list[i]=='<%=loginid%>')
					voterOk=true;
			}
			
			if(voterOk==true){
				alert('투표했다');
				$.ajax({
					type : 'GET',
					url : '/decisionitem/'+<%=dscode%>,
					success : function(response) {
						if (response.length > 0){
							alert(response);
						}
						else{
							alert('Server or Client ERROR, 의사결정 정보 조회 실패');
						}
					},
					error : function(e) {
						alert("ERROR : " + e.statusText);
					}
				});
			}else{
				alert('투표 안했다ㅇㄴㅋㅋㅋ.');
				$.ajax({
					type : 'GET',
					url : '/decisionitem/'+<%=dscode%>,
					success : function(response) {
						if (response.length > 0){
							alert(response);
						}
						else{
							alert('Server or Client ERROR, 의사결정 정보 조회 실패');
						}
					},
					error : function(e) {
						alert("ERROR : " + e.statusText);
					}
				});
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
});
	/*  /의사결정의 항목 조회*/
</script>
</html>