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

<script type="text/javascript">

var a='<%=permission%>';
$(document).ready(function(){
	if(a=='OWNER'){
		$("#decisiondel").show();
	
	}
	else if(a=='MEMBER'){
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
					<h4 class="modal-title">종료된 투표 입ㅇ니다.</h4>
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
$(function(){
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
});
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

function proCancel(){
	window.close();
}
</script>


<!-- <script type="text/javascript">

	/* 의사결정 수정*/
	var param = {
		'tcode' : '어떤 공용업무로  의사결정을 이동할것인지 TCODE',
		'dstitle' : '의사결정 제목',
		'dsclose' : '0이면아직안끝남 1이면 끝남',
		'dscode' : '어떤의사결정 코드 수정할것인지'
	};
	$.ajax({
		type : 'PUT',
		url : 'decision',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('의사결정 수정 완료! ' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 의사결정 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/*/의사결정 수정 */

	/* 의사결정 아이템 수정*/
	var param = {
		'dsilist' : '의사결정 항목 이름을 변경할 새로운 이름',
		'dsicode' : '의사결정 항목을 변경할 의사결정 항목 DSICODE(항목번호가아닌 primary key)'
	};
	$.ajax({
		type : 'PUT',
		url : 'decisionitem',
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(response) {
			if (response == 1) {
				alert('의사결정 아이템 수정 완료! ' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 의사결정 아이템 수정 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/* /의사결정 아이템 수정*/

	/* 의사결정 아이템 삭제*/
	$.ajax({
		type : 'DELETE',
		url : 'decisionitem/'
				+ '의사결정 항목을 삭제할 의사결정 항목 DSICODE(항목번호가아닌 primary key)',
		success : function(response) {
			if (response == 1) {
				alert('의사결정 아이템 삭제 완료! ' + response);
			} else if (response == -1) {
				alert('Server or Client ERROR, 의사결정 아이템 삭제 실패');
			}
		},
		error : function(e) {
			alert("ERROR : " + e.statusText);
		}
	});
	/* /의사결정 아이템 삭제*/
</script> -->
</html>