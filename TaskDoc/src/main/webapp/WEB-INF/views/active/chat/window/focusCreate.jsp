<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String pcode=request.getParameter("pcode");
	String crcode=request.getParameter("crcode");
%>
</head>
<body>

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
});
var param = {
		'chatRoom' : {
			//회의록 형식이므로 crmode 2번
			'crmode' : 3,
			'crclose' : 0,
			'fctitle' : //채워줘
			'tcode' :  //채워줘ㅇ
			'crcode': <%=crcode%>
		},
		'userInfo' : {
			'uid' : jsonlist,
		},
		'project' : {
			'pcode' : <%=pcode%>,
		}
};
$.ajax({
	type : 'POST',
	url : '/chatroom/multi',
	contentType : 'application/json',
	data : JSON.stringify(param),
	success : function(response) {
		if (response>0) {
			alert('채팅방 생성 완료! 채팅방 crcode값은'+response);
			location.reload();
		}
		else if(response<0){
			alert('Server or Client ERROR, 채팅방 생성 실패');
		}
	},
	error : function(e) {
		alert("ERROR : " + e.statusText);
	}
});
</script>
</html>