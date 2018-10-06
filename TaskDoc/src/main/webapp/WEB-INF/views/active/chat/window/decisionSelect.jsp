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
	String tcode=request.getParameter("tcode");
	String dstitle=request.getParameter("dstitle");
	String dsdate=request.getParameter("dsdate");
	String permission=request.getParameter("permission");
%>

<script type="text/javascript">

var a='<%=permission%>';

$(document).ready(function(){
	if(a=='OWNER'){
		$("#decisionend").show();
		$("#decisiondel").show();
	
	}
	else if(a=='MEMBER'){
		$("#decisionend").hide();
		$("#decisiondel").hide();
	}
});
</script>

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
								<div id="tableDiv">
									<table class="table">
									
										<thead id="thead">
											<tr>
												<th>번호</th>
												<th>문항</th>
												<th>체크</th>
												<th>COUNT</th>
											</tr>
										</thead>
										
										<tbody id="tbody">
																
										</tbody>
									</table>
								</div>

							</div>
							<h4 class="endhaha" style="color: red"></h4>
							<div></div>

						</div>
					</div>
					<div class="modal-footer">
						<button id="decisiondel" type="button" class="btn" style="display:none;outline:none;border:0px;background-color:#ed8151;color:white;"
							onclick="decisionDel()">
							삭제
						</button>
						<button id="decisionend" type="button" class="btn" style="display:none;outline:none;border:0px;background-color:#ed8151;color:white;"
							onclick="decisionEnd()">
							종료
						</button>
						<button type="button" class="btn" style="outline:none;border:0px;background-color:#ed8151;color:white;"
							id="choiceDecision">
							선택하기
						</button>
						<button type="button" class="btn" style="outline:none;border:0px;background-color:#ed8151;color:white;"
							onclick="proCancel()">
							Cancel
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
				$("#choiceDecision").attr('disabled','true');
				$.ajax({
					type : 'GET',
					url : '/decisionitem/count/'+<%=dscode%>,
					success : function(response) {
						if (response.list.length > 0){
							for(var i=0;i<response.list.length;i++) {
								$tdiv='<tr><td>'+ (i+1) + '</td><td>' + response.list[i].dsilist + '</td>'
								+'<td><input class="group" type="radio" name="radioTxt" value="' + response.list[i].dsicode + ',' + response.list[i].dsilist + '"></td><td>' + response.count[i] + '</td></tr>';
								$("#tbody").append($tdiv);
							}
							$("input[type=radio]").attr('disabled', true);
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
				alert('투표 안했다');
				$.ajax({
					type : 'GET',
					url : '/decisionitem/count/'+<%=dscode%>,
					success : function(response) {
						if (response.list.length > 0){
							for(var i=0;i<response.list.length;i++) {
								$tdiv='<tr><td>'+ (i+1) + '</td><td>' + response.list[i].dsilist + '</td>'
								+'<td><input type="radio" name="radioTxt" value="' + response.list[i].dsicode + ',' + response.list[i].dsilist + '"></td><td>' + response.count[i] + '</td></tr>';
								$("#tbody").append($tdiv);
							}
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
		
    	/* 의사결정 항목 선택하기*/
		 $('#choiceDecision').click(function () {
			//radioVal -> (dsicode, dsilist)
	        var radioVal = $('input[name="radioTxt"]:checked').val();
	        var dsicode={};
	        dsicode=radioVal.split(',');
	         
	     	var param = {
	     		'dsicode' : dsicode[0],
	     		'uid' : '<%=loginid%>'
	     	};
	     	$.ajax({
	     		type : 'POST',
	     		url : '/voter',
	     		contentType : 'application/json',
	     		data : JSON.stringify(param),
	     		success : function(response) {
	     			if (response > 0) {
	     				alert('의사결정 항목 선택 완료! ' + response);
	     			 	window.close();
	     			} else{
	     				alert('Server or Client ERROR, 의사결정 항목 선택 실패');
	     			}
	     		},
	     		error : function(e) {
	     			alert("ERROR : " + e.statusText);
	     		}
	     	});
		});	
	});
	
	//window창 닫기
	function proCancel(){
		window.close();
	}	
	
	//의사 결정 종료
	function decisionEnd(){
		var param={
			'tcode' : <%=tcode%>,
			'dstitle' : '<%=dstitle%>',
			'dsclose' : 1,
			'dscode' : <%=dscode%>	
		};
		
		$.ajax({
			type : 'PUT',
			url : '/decision',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response >0) {
					alert('의사결정 종료 완료!');
					window.close();
				} else {
					alert('Server or Client ERROR, 의사결정 종료 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}
	
	//의사결정 삭제
	function decisionDel(){
		$.ajax({
			type : 'DELETE',
			url : '/decision/'+<%=dscode%>,
			success : function(response) {
				if(response>0){
					alert('의사결정 삭제 성공');
					window.close();
					opener.parent.menubtn();
				}
				else{
					alert('Server or Client ERROR, 의사결정 삭제 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	}
	
</script>
</html>