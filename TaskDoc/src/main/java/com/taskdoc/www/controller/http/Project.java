package com.taskdoc.www.controller.http;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;

@Controller
@RequestMapping("/project")
public class Project {
	private static final Logger logger = LoggerFactory.getLogger(Project.class);

	/*
	 * 2.프로젝트 메인 , 생성 , 프로젝트 멤버 초대, 프로젝트(이름, 멤버 삭제 등등,,) 수정 , 프로젝트 공지사항,
	 * 
	 */
	
	//session
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "/active/project/main";
	}

	//session
	@RequestMapping(value = "/create")
	public String create() {
		return "/active/project/window/create";
	}

	//session
	@RequestMapping(value = "/userInvite", method = RequestMethod.GET)
	public String userInvite() {
		return "/active/project/window/userInvite";
	}

	//session
	@RequestMapping(value = "/infoEdit", method = RequestMethod.GET)
	public String infoEdit() {
		return "/active/project/infoEdit";
	}

	//session
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return "/active/project/window/notice";
	}
}
