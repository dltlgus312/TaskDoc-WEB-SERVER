/*TOOLTIP JS , HOVER JS */
$(document).ready(function() {
	$('[data-toggle="tootlip"]').tooltip();

	$(".h-describe").hover(function() {
		$(this).css("background-color", "#ed8151");
		$("#describe").attr("src", "/resources/img/hover_describe.png");
	}, function() {
		$(this).css("background-color", "white");
		$("#describe").attr("src", "/resources/img/img_describe.png");
	});
	$(".h-task").hover(function() {
		$(this).css("background-color", "#ed8151");
		$("#task").attr("src", " /resources/img/hover_task.png");
	}, function() {
		$(this).css("background-color", "white");
		$("#task").attr("src", " /resources/img/img_task.png");
	});
	$(".h-user").hover(function() {
		$(this).css("background-color", "#ed8151");
		$("#user").attr("src", " /resources/img/hover_user.png");
	}, function() {
		$(this).css("background-color", "white");
		$("#user").attr("src", " /resources/img/img_user.png");
	});
	$(".h-board").hover(function() {
		$(this).css("background-color", "#ed8151");
		$("#board").attr("src", " /resources/img/hover_board.png");
	}, function() {
		$(this).css("background-color", "white");
		$("#board").attr("src", " /resources/img/img_board.png");
	});
	$(".h-settings").hover(function() {
		$(this).css("background-color", "#ed8151");
		$("#settings").attr("src", " /resources/img/hover_settings.png");
	}, function() {
		$(this).css("background-color", "white");
		$("#settings").attr("src", " /resources/img/img_settings.png");
	});
	$(".h-logout").hover(function() {
		$(this).css("background-color", "#ed8151");
		$("#logout").attr("src", " /resources/img/hover_logout.png");
	}, function() {
		$(this).css("background-color", "white");
		$("#logout").attr("src", " /resources/img/img_logout.png");
	});
});