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
	//test2
	@RequestMapping(value = "/tetete2", method = RequestMethod.GET)
	public String tetete2() {
		return "tetete2";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String TaskDocMain() {
		return "taskdocMain";
	}
	
	//테스트용
	@RequestMapping(value = "/project/taskview", method = RequestMethod.GET)
	public String taskview() {
		return "/active/project/taskview";
	}
	@RequestMapping(value = "/project/gantview", method = RequestMethod.GET)
	public String gantview() {
		return "/active/project/gantview";
	}
	@RequestMapping(value = "/project/fileview", method = RequestMethod.GET)
	public String fileview() {
		return "/active/project/fileview";
	}
	
}
