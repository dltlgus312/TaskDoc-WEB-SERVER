<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/fix/header.jsp"%>
<%
	String loginid = "";
	loginid = (String) session.getAttribute("loginid");
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
			<div id="contentwrap">
	
				<!--PROJECT_WRAP -->				
				<div id="project_wrap">
				
					<!--PROJECT_LIST_WRAP -->
					<div class="project_list_wrap">
					
						<!--PROJECT_LISTDIV_WRAP  -->
						<div class="project_listdiv_wrap">
							
							<!--PROJECT_LIST  -->
							<div class="project_list">
								<!--PROJECT_LIST_CONTENT_WRAP  -->
								<div class="project_list_content_wrap">
									<div class="projectheader"
										style="width: 100%; height: 50px; background-color: orange;">
										<div class="projectheaderleft"
											style="width: 300px; height: 100%; background-color: red; float: left;"></div>
										<div class="projectheaderright"
											style="width: 50px; height: 100%; background-color: grey; float: right;"></div>
									</div>
									<div class="projectbottom"
										style="width: 100%; height: 200px; background-color: green;">
										<div
											style="width: 100%; background-color: white; height: 50px; overflow: auto;">
											<span> 하이 </span>
										</div>
										<div
											style="width: 100%; height: 50px; background-color: orange;">START</div>
										<div
											style="width: 100%; height: 50px; background-color: grey;">END</div>
										<div
											style="width: 100%; height: 50px; background-color: aqua;">직책</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div style="width: 100%; height: 50%; display: contents;">
						<div style="width: 100%; height: 300px; display: -webkit-box;">
							<div class="tessssst"
								style="margin-right: 10px; width: 350px; height: 250px; cursor: pointer; box-shadow: 4px 4px 7px grey">
								<div class="projectwrap"
									style="background-color: white; width: 100%; height: 100%;">
									<div class="projectheader"
										style="width: 100%; height: 50px; background-color: orange;">
										<div class="projectheaderleft"
											style="width: 300px; height: 100%; background-color: red; float: left;"></div>
										<div class="projectheaderright"
											style="width: 50px; height: 100%; background-color: grey; float: right;"></div>
									</div>
									<div class="projectbottom"
										style="width: 100%; height: 200px; background-color: green;">
										<div
											style="width: 100%; background-color: white; height: 50px; overflow: auto;">
											<span id="spantest">하이</span>
										</div>
										<div
											style="width: 100%; height: 50px; background-color: orange;">START</div>
										<div
											style="width: 100%; height: 50px; background-color: grey;">END</div>
										<div
											style="width: 100%; height: 50px; background-color: aqua;">직책</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
				<!--PROJECT_WRAP -->				

			</div>
			<!--CONTENTWRAP  -->		
			
		</div>
		<!--FRAME  -->

		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->
	</div>
</body>
</html>