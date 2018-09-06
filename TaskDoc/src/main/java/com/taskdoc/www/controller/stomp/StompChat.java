package com.taskdoc.www.controller.stomp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.taskdoc.www.database.dto.ChatContentsVO;
import com.taskdoc.www.database.dto.UserInfoVO;

@RestController
public class StompChat {
	@Autowired
	RestTemplate rest;
	
	//Example)
	@MessageMapping("/in/tt")
	@SendTo("/topic/in")
	public ChatContentsVO test(ChatContentsVO chatContentsVO){
		return chatContentsVO;
	}

}
