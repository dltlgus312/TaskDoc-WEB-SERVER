package com.taskdoc.www.controller.stomp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class StompChat {
	@Autowired
	RestTemplate rest;
	
	
	//Example)
	@MessageMapping("/chat/{crcode}")
	@SendTo("/chat/{crcode}")
	public Map<String, Object> test(Map<String, Object> map){
		return map;
	}

}
