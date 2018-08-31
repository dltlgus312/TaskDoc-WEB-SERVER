package com.taskdoc.www.controller.http;


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
	
	//프로젝트 리스트들.
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "/active/project/main";
	}

	//프로젝트 생성하기
	@RequestMapping(value = "/create")
	public String create() {
		return "/active/project/window/create";
	}

	//프로젝트에 회원초대하기
	@RequestMapping(value = "/userInvite", method = RequestMethod.GET)
	public String userInvite() {
		return "/active/project/window/userInvite";
	}
	
	//프로젝트 상세보기
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String info() {
		return "/active/project/view";
	}

	//프로젝트 정보수정
	@RequestMapping(value = "/infoEdit", method = RequestMethod.GET)
	public String infoEdit() {
		return "/active/project/window/infoEdit";
	}

	//session
	@RequestMapping(value = "/noticeCreate", method = RequestMethod.GET)
	public String noticecreate() {
		return "/active/project/notice/create";
	}
	//session
	@RequestMapping(value = "/noticeView", method = RequestMethod.GET)
	public String noticeview() {
		return "/active/project/notice/view";
	}
	//session
	@RequestMapping(value = "/noticeEdit", method = RequestMethod.GET)
	public String noticemodify() {
		return "/active/project/notice/edit";
	}
}
