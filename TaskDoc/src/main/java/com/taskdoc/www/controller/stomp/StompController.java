package com.taskdoc.www.controller.stomp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class StompController {
	@Autowired
	RestTemplate rest;
	
	@MessageMapping("/project/{pcode}")
	@SendTo("/project/{pcode}")
	public Map<String, Object> test(Map<String, Object> map){
		System.out.println(map);
		
		return map;
	}

}
// message : insert, type : chatcontents, object : ChatContentsVO