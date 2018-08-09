package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class User {
	/*
	 * 1.로그인 , 회원가입, 회원정보수정
	 *
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String userLogin() {
		return "/user/login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/user/join";
	}

	//session
	@RequestMapping(value = "/infoEdit", method = RequestMethod.GET)
	public String infoEdit() {
		return "/user/infoEdit";
	}
}
