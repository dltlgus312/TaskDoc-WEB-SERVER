package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Home {
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
	
	@RequestMapping(value = "/publicTaskMain", method = RequestMethod.GET)
	public String publicTaskMain() {
		return "publicTaskMain";
	}
	@RequestMapping(value = "/publicTaskCreate", method = RequestMethod.GET)
	public String publicTaskCreate() {
		return "publicTaskCreate";
	}
	@RequestMapping(value = "/publicTaskEdit", method = RequestMethod.GET)
	public String publicTaskEdit() {
		return "publicTaskEdit";
	}
	@RequestMapping(value = "/privateTaskMain", method = RequestMethod.GET)
	public String privateTaskMain() {
		return "privateTaskMain";
	}
	@RequestMapping(value = "/privateTaskCreate", method = RequestMethod.GET)
	public String privateTaskCreate() {
		return "privateTaskCreate";
	}
	@RequestMapping(value = "/privateTaskEdit", method = RequestMethod.GET)
	public String privateTaskEdit() {
		return "privateTaskEdit";
	}
	
	
	/*
	 * 5.방법론 게시판메인, 게시판 수정
	 * 
	 */
	
	@RequestMapping(value = "/methodBoard", method = RequestMethod.GET)
	public String methodBoard() {
		return "methodBoard";
	}
	@RequestMapping(value = "/methodBoardEdit", method = RequestMethod.GET)
	public String methodBoardEdit() {
		return "methodBoardEdit";
	}
	
	
	
	
}
