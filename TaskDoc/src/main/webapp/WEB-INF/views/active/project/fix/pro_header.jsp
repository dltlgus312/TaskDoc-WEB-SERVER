<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/project/pro_header.js?ver=616"></script>
<div id="proheader"
	style="display: -webkit-box; width: 100%; height: 7%; border-bottom: 1px solid gray;">
	<div id="proheadername" style="width: 25%;">
		<span id="pro_title" style="color: black; font-size: 20px;"></span>
	</div>

	<div id="proheaderli" style="width: 50%; text-align: center;">
		<a class="chat_hover" id="z" data-toggle="tab" href="#chats"
			style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">채팅</a>
		<a class="ptask_hover" data-toggle="tab" href="#ptasks"
			style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">공용
			업무</a> <a class="gantt_hover" data-toggle="tab" href="#gantts"
			style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">간트차트</a>
		<a class="files_hover" data-toggle="tab" href="#files"
			style="color: #6d6d6d; font-size: 20px; margin-right: 2%; text-decoration: none;">파일
			모아보기</a>
	</div>

	<div id="proheaderbtn" style="width: 25%; display: -webkit-box;">

		<div style="width: calc(100%/ 3); height: 40px;">
			<button id="prochatbtn1" type="button"
				style="height: 42px; float: right; outline: none; border: 0; background-color: white; width: 100%;">
				<img
					src="${pageContext.request.contextPath }/resources/img/img_chat.png"
					alt="" style="width: 15px; height: 15px;"> <span>프로젝트
					대화</span>
			</button>
		</div>

		<div class="dropdown" style="width: calc(100%/ 3); height: 40px;">
			<button class="btn btn-primary dropdown-toggle" type="button"
				data-toggle="dropdown" id="prochatbtn2" type="button"
				style="height: 42px; float: right; outline: none; border: 0; background-color: white; padding: 0; width: 100%;">
				<img
					src="${pageContext.request.contextPath }/resources/img/img_proinvite.png"
					alt="" style="width: 15px; height: 15px;"> <span
					id="propeople" style="color: black;"></span>
			</button>

			<ul id="propeoplelist" class="dropdown-menu" style="right: 0;">
			</ul>
		</div>

		<div id="setornotice" style="width: calc(100%/ 3); height: 40px;">
		</div>

	</div>
</div>