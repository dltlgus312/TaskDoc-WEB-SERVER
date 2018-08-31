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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String TaskDocMain() {
		return "taskdocMain";
	}
	
}
