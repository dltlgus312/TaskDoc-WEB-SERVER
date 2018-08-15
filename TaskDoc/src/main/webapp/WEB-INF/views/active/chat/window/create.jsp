<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var param = {
			'userinfo' : {
				'uid' : $("#example").val(),
			},
			'project' : {
				'ptitle' : $("#example").val(),
				'psubtitle' : $("#example").val(),
				'psdate' : $("#example").val(),
				'pedate' : $("#example").val()
			}
		};
		$.ajax({
			type : 'POST',
			url : 'project',
			contentType : 'application/json',
			data : JSON.stringify(param),
			success : function(response) {
				if (response != -1) {
					alert('프로젝트 생성 완료! 프로젝트의 pid값은'+response);
				}
				else if(response==-1){
					alert('Server or Client ERROR, 프로젝트 생성 실패');
				}
			},
			error : function(e) {
				alert("ERROR : " + e.statusText);
			}
		});
	</script>
</body>
</html>