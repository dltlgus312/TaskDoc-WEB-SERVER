package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class temp {
	@RequestMapping("/")
	public String temp() {
		return "temp";
	}
}
