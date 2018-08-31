package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Home {
	
	//test
	@RequestMapping(value = "/tetete", method = RequestMethod.GET)
	public String tetete() {
		return "tetete";
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
	
	
}
