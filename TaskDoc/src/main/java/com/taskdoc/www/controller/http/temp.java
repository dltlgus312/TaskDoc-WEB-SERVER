package com.taskdoc.www.controller.http;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class temp {
	@RequestMapping("/")
	public String temp() {
		return "temp";
	}
}
