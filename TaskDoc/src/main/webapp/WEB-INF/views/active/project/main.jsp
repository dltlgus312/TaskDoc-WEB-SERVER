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

						<!--append1개당 project 4개씩  -->
						<div class="project_listdiv_wrap">
								
							<!--위 div에 append할것 , PROJECT_LIST  -->
							<div class="project_list">

								<!--PROJECT_LIST_CONTENT_WRAP  -->
								<div class="project_list_content_wrap">

									<!--PROJECT_LIST_CONTENT_HEADER  -->
									<div class="project_list_content_header">

										<!--PROJECT_LIST_CONTENT_HEADER_LEFT  -->
										<div class="project_list_content_header_left">
											<span>여기는 프로젝트명이적힐곳</span>
										</div>
										<!--PROJECT_LIST_CONTENT_HEADER_LEFT  -->

										<!--PROJECT_LIST_CONTENT_HEADER_RIGHT  -->
										<div class="project_list_content_header_right">
											<!--직책이 OWNER일 경우에만 아래 두 이미지 생성하기  -->
											<button id="prosettingbtn" style="width:50px;height:25px; text-align:center;border: 0;outline: 0;background-color: white;">
												<img alt="" src="${pageContext.request.contextPath }/resources/img/img_boardsetting.png" style="width:22px;height:22px;">
											</button>
											<button id="proinvitebtn" style="width:50px;height:25px;text-align:center;border: 0;outline: 0;background-color: white;">
												<img alt="" src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"style="width:22px;height:22px;">
											</button>
										</div>
										<!--PROJECT_LIST_CONTENT_HEADER_RIGHT  -->

									</div>
									<!--PROJECT_LIST_CONTENT_HEADER  -->

									<!--PROJECT_LIST_CONTENT_BOTTOM  -->
									<div class="project_list_content_bottom">

										<!--PROJECT_LIST_SUBTITLE  -->
										<div class="project_list_subtitle">
											<span>여기는 프로젝트 부제목명이 적힐곳</span>
										</div>
										<!--PROJECT_LIST_SUBTITLE  -->

										<!--PROJECT_LIST_START  -->
										<div class="project_list_start">
										<span style="line-height:50px;">START 여기는 시작 날짜가 적힐곳</span>
										</div>
										<!--PROJECT_LIST_START  -->

										<!--PROJECT_LIST_END  -->
										<div class="project_list_end">
										<span style="line-height:50px;">END 여기는 끝나는 날짜가 적힐곳</span>
										</div>
										<!--PROJECT_LIST_END  -->

										<!--PROJECT_LIST_POSITION  -->
										<div class="project_list_position">
										<span style="line-height: 50px; float: right;">직책이 적힐곳</span>
										</div>
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


