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

	//공지사항메인
	@RequestMapping(value = "/noticeMain", method = RequestMethod.GET)
	public String noticeMain() {
		return "/active/project/notice/main";
	}
	//공지사항생성
	@RequestMapping(value = "/noticeCreate", method = RequestMethod.GET)
	public String noticecreate() {
		return "/active/project/notice/create";
	}
	//공지사항상세보기
	@RequestMapping(value = "/noticeView", method = RequestMethod.GET)
	public String noticeview() {
		return "/active/project/notice/view";
	}
	//공지사항수정
	@RequestMapping(value = "/noticeEdit", method = RequestMethod.GET)
	public String noticemodify() {
		return "/active/project/notice/edit";
	}
	
	
	
	/*
	 * 4.공용 업무 메인, 공용 업무 생성 ,공용 업무 수정 ,개인 업무 메인  , 개인 업무 생성, 개인 업무 수정  
	 * 
	 */
	
	//session
	@RequestMapping(value = "/publicTask/main", method = RequestMethod.GET)
	public String publicTaskMain() {
		return "publicTaskMain";
	}
	
	//session
	@RequestMapping(value = "/publicTask/create", method = RequestMethod.GET)
	public String publicTaskCreate() {
		return "/temp/publictaskcreate";
	}
	
	//session
	@RequestMapping(value = "/publicTask/edit", method = RequestMethod.GET)
	public String publicTaskEdit() {
		return "publicTaskEdit";
	}
	
	//session
	@RequestMapping(value = "/privateTask/main", method = RequestMethod.GET)
	public String privateTaskMain() {
		return "privateTaskMain";
	}
	
	//session
	@RequestMapping(value = "/privateTask/create", method = RequestMethod.GET)
	public String privateTaskCreate() {
		return "/active/temp/publictaskcreate";
	}
	
	//session
	@RequestMapping(value = "/privateTask/edit", method = RequestMethod.GET)
	public String privateTaskEdit() {
		return "privateTaskEdit";
	}
}
