package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Home {
	//test
	@RequestMapping(value = "/ajaxTest", method = RequestMethod.GET)
	public String ajaxTest() {
		return "ajaxTest";
	}
	@RequestMapping(value = "/sidebar", method = RequestMethod.GET)
	public String sidetest() {
		return "/fix/sidebar";
	}
	@RequestMapping(value = "/tetete", method = RequestMethod.GET)
	public String tetete() {
		return "tetete";
	}
	//test
	
	//header side footer 고정
	//body change
	
	/*
	 *1.메인 , 로그인 , 회원가입, 회원정보수정
	 *
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String TaskDocMain() {
		return "taskdocMain";
	}
	
	
	
	
	
	
	/*
	 * 4.공용 업무 메인, 공용 업무 생성 ,공용 업무 수정 ,개인 업무 메인  , 개인 업무 생성, 개인 업무 수정  
	 * 
	 */
	
	//session
	@RequestMapping(value = "/publicTaskMain", method = RequestMethod.GET)
	public String publicTaskMain() {
		return "publicTaskMain";
	}
	
	//session
	@RequestMapping(value = "/publicTaskCreate", method = RequestMethod.GET)
	public String publicTaskCreate() {
		return "publicTaskCreate";
	}
	
	//session
	@RequestMapping(value = "/publicTaskEdit", method = RequestMethod.GET)
	public String publicTaskEdit() {
		return "publicTaskEdit";
	}
	
	//session
	@RequestMapping(value = "/privateTaskMain", method = RequestMethod.GET)
	public String privateTaskMain() {
		return "privateTaskMain";
	}
	
	//session
	@RequestMapping(value = "/privateTaskCreate", method = RequestMethod.GET)
	public String privateTaskCreate() {
		return "privateTaskCreate";
	}
	
	//session
	@RequestMapping(value = "/privateTaskEdit", method = RequestMethod.GET)
	public String privateTaskEdit() {
		return "privateTaskEdit";
	}
	
	
	/*
	 * 5.방법론 게시판메인, 게시판 수정
	 * 
	 */
	
	//session
	@RequestMapping(value = "/methodBoard", method = RequestMethod.GET)
	public String methodBoard() {
		return "/active/methodboard/methodBoard";
	}
	
	//session
	@RequestMapping(value = "/methodBoardCreate", method = RequestMethod.GET)
	public String methodBoardCreate() {
		return "/active/methodboard/methodBoardCreate";
	}
	//session
	@RequestMapping(value = "/methodBoardView", method = RequestMethod.GET)
	public String methodBoardView() {
		return "/active/methodboard/methodBoardView";
	}
	//session
	@RequestMapping(value = "/methodBoardEdit", method = RequestMethod.GET)
	public String methodBoardEdit() {
		return "/active/methodboard/methodBoardEdit";
	}
	//session
	@RequestMapping(value = "/BoardSelectProject", method = RequestMethod.GET)
	public String BoardSelectProject() {
		return "/active/methodboard/selectProject";
	}
	
	
	
	
}
