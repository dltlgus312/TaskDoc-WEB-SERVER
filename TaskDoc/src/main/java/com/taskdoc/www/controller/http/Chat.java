package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat")
public class Chat {
	/*
	 * 3.공용업무리스트메인, 공용업무 생성, 공용업무 수정 , 개인업무리스트, 개인업무리스트 생성, 개인업무리스트 수정 ,
	 * 
	 */

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "/active/chat/main";
	}

	//session
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create() {
		return "/active/chat/window/create";
	}
	//session
	@RequestMapping(value = "/userInvite", method = RequestMethod.GET)
	public String userinvite() {
		return "/active/chat/window/userInvite";
	}
	
	//session
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
	public String fileUpload() {
		return "/active/chat/window/fileUpload";
	}

	//session
	@RequestMapping(value = "/decision", method = RequestMethod.GET)
	public String decision() {
		return "/active/chat/window/decision";
	}

	//session
	@RequestMapping(value = "/focus", method = RequestMethod.GET)
	public String focus() {
		return "/active/chat/window/focus";
	}

	//session
	@RequestMapping(value = "/documentFeedback", method = RequestMethod.GET)
	public String documentFeedback() {
		return "documentFeedback";
	}
}
