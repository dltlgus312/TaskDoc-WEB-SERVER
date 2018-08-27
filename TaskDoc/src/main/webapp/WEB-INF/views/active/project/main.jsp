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

					<!--PROJECT_LIST_WRAP / TOP(pinvite=1인 프로젝트)-->
					<div id="project_list_wrap_top">

						<!-- 이거 div당 project 4개씩  -->
						<div class="project_listdiv_wrap">

							<!--PROJECT_LIST  -->
							<div class="project_list">

								<!--PROJECT_LIST_CONTENT_WRAP  -->
								<div class="project_list_content_wrap">

									<!--PROJECT_LIST_CONTENT_HEADER  -->
									<div class="project_list_content_header">

										<!--PROJECT_LIST_CONTENT_HEADER_LEFT  -->
										<div class="project_list_content_header_left"></div>
										<!--PROJECT_LIST_CONTENT_HEADER_LEFT  -->

										<!--PROJECT_LIST_CONTENT_HEADER_RIGHT  -->
										<div class="project_list_content_header_right"></div>
										<!--PROJECT_LIST_CONTENT_HEADER_RIGHT  -->

									</div>
									<!--PROJECT_LIST_CONTENT_HEADER  -->

									<!--PROJECT_LIST_CONTENT_BOTTOM  -->
									<div class="project_list_content_bottom">

										<!--PROJECT_LIST_SUBTITLE  -->
										<div class="project_list_subtitle">
											<span> 하이 </span>
										</div>
										<!--PROJECT_LIST_SUBTITLE  -->

										<!--PROJECT_LIST_START  -->
										<div class="project_list_start">START</div>
										<!--PROJECT_LIST_START  -->

										<!--PROJECT_LIST_END  -->
										<div class="project_list_end">END</div>
										<!--PROJECT_LIST_END  -->

										<!--PROJECT_LIST_POSITION  -->
										<div class="project_list_position">직책</div>
										<!--PROJECT_LIST_POSITION  -->

									</div>
									<!--PROJECT_LIST_CONTENT_BOTTOM  -->

								</div>
								<!--PROJECT_LIST_CONTENT_WRAP  -->

							</div>
							<!--PROJECT_LIST  -->

						</div>
						<!-- 이거 div당 project 4개씩  -->

					</div>
					<!--PROJECT_LIST_WRAP / TOP(pinvite=1인 프로젝트)-->

					<!--PROJECT_LIST_WRAP_BOTTOM / BOTTOM(pinvite=0인 프로젝트)-->
					<div id="project_list_wrap_bottom"></div>
					<!--PROJECT_LIST_WRAP / BOTTOM(pinvite=0인 프로젝트)-->

				</div>
				<!--PROJECT_WRAP -->

			</div>
			<!--PROJECT_WRAP -->

		</div>
		<!--CONTENTWRAP  -->

		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/fix/footer.jsp"%>
		<!-- FOOTER -->
	</div>
	<!--FRAME  -->


</body>
</html>


