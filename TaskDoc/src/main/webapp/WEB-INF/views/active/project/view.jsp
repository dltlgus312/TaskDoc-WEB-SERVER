<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
	String pcode=request.getParameter("pcode");
%>

<script type="text/javascript">
var id='<%=loginid%>';
	if (id == "null") {
		alert('로그인이 필요한 페이지입니다.');
		window.location.href = '/';
	}
//pro_header.jsp , pro_header.js 에서 <script>태그 안에서 변수 사용가능하다.	
var pcode=<%=pcode%>;

</script>

</head>
<body>
	<!--FRAME  -->
	<div id="frame">
		<!--MAIN HEADER  -->
		<%@include file="/WEB-INF/views/fix/main_header.jsp"%>
		<!--MAIN HEADER  -->

		<!--WRAPPER  -->
		<div id="wrapper">

			<!--SIDE BAR  -->
			<%@include file="/WEB-INF/views/fix/left_side.jsp"%>
			<!--SIDE BAR  -->

			<!--CONTENTWRAP  -->
			<div id="contentwrap" style="background-color: #e0e0e0;">
				<div class="container"
					style="background-color: white; overflow: auto;">
					
					<!-- PROJECT_FIX_HEADER  -->
					<%@include file="/WEB-INF/views/active/project/fix/pro_header.jsp" %>
					
					<!-- TAB CONTENTS  -->
					<div class="tab-content" style="width:100%;height:93%;">
						
						<!--chat include -->
						<div id="chats" class="tab-pane fade in active" style="width:100%;height:100%;">
						<div style="background-color:black; width:500px;height:500px;">
						 	</div>
						 	<div style="background-color:black; width:500px;height:500px;">
						 	</div>
						 	<div style="background-color:black; width:500px;height:500px;">
						 	</div>
						</div>
						
						<!--public task include -->	
						<div id="ptasks" class="tab-pane fade">
						public task
						</div>

						<!--gantt  include-->	
						<div id="gantts" class="tab-pane fade">
						gantt
						</div>
						
						<!--files include -->
						<div id="files" class="tab-pane fade">
						files
						</div>
						
					</div>
				</div>

			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->

	</div>
	<!--FRAME  -->
</body>
</html>