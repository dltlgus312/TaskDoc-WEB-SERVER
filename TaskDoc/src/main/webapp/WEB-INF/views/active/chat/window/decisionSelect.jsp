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
%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/fix/session.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
							<div>
								<label style="padding-top: 6px">의사결정 문항</label>
								<div id="tableDiv" style="display: none;">
									<table class="table">
										<!--Table head-->
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
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var decisionitemlist = [];

	$(document).ready(function() {
		/* 	종료는  type이 OWNER일 경우에만 가능
		 *   1. if(의사결정이 끝낫는지 안끝낫는지 체크) 
		 * 		else( 1-1 의사결정항목 조회)
		 *				if(1-3 본인이 투표를 했는지 안했는지 체크)
		 *						if(1-3-1 본인이 투표를했다면 -> 체크리스트, 투표하기버튼 잠금)
		 *							if(1-3-1-1 본인이 투표를했지만 수정하고싶은경우 체크리스트, 투표하기버튼을 활성화한후 ajax PUT으로 보내자.)
		 *						else(1-3-2 본인이 투표를하지않았다면 -> 체크리스트, 투표하기버튼 활성화)
		 *    2.else(2-1 종료되었다면  종료버튼, 체크리스트 모두 잠금).
		 */
		$.ajax({
			type : 'GET',
			url : '/decision',
			success : function(response) {
				if (Object.keys(response).length > 0) {
					alert('의사결정 정보 조회 완료! ' + response);
					if (response.dsclose == 0) {
						//종료되지 않은 투표면 항목조회
						$.ajax({
							type : 'GET',
							url : '/decisionitem/' + 16,
							success : function(response) {
								if (response.length > 0) {
									alert('의사결정 항목 조회 완료! ' + response);
									for (var i = 0; i < response.length; i++) {
										decisionitemlist.push(response[i].dsilist);
									}
									$("#tableDiv").show();
									alert(decisionitemlist);
									for (var i = 0; i < decisionitemlist.length; i++) {
									$('.modal-title').text(response[i].dname);

										var ttag = document.createElement("tr");
										
										/* didx 번호 */
										var thidx = document.createElement("th");
										var idxele = document.createTextNode(response[i].didx);
										ttag.appendChild(thidx);
										thidx.appendChild(idxele);

										/*dcontent 문항*/
										var thcon=document.createElement("th");
										var conele=document.createTextNode(response[i].dcontent);
										ttag.appendChild(thcon);
										thcon.appendChild(conele);
										
										
										/* 체크버튼 */
										var thck = document.createElement("th");
										var ckbox = document.createElement("input");
										ckbox.setAttribute('type', 'checkbox');
										ckbox.setAttribute('value', response[i].dcode);
										ckbox.setAttribute('name', 'chkbox');
										ckbox.setAttribute('onclick', 'check_only(this)');
										if(trueorfalse=="true" || yesorno=="yes") {
											ckbox.setAttribute('disabled', true);
											$("#Okbtn").attr('disabled', true);
										}
										
										ttag.appendChild(thck);
										thck.appendChild(ckbox);
										
										/*선택한 문항 count*/
										var thcnt = document.createElement("th");
										var cntele = document.createTextNode(response[i].selectCount);
										ttag.appendChild(thcnt);
										thcnt.appendChild(cntele);

										document.getElementById('thead').appendChild(ttag);

									}
								} else {
									alert('Server or Client ERROR, 의사결정 항목 조회 실패');
								}
							},
							error : function(e) {
								alert("ERROR : " + e.statusText);
							}
						});
					} else {
						//종료된 투표라도 항목조회후 button , checklist 잠금
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
	});
	/*  /의사결정의 항목 조회*/
</script>
</html>