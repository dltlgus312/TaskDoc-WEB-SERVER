package com.taskdoc.www.controller.stomp;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.sun.jndi.toolkit.url.Uri;
import com.taskdoc.www.database.dto.ChatContentsVO;
import com.taskdoc.www.system.JsonMapper;

@RestController
public class StompController {
	@Autowired
	RestTemplate rest;

	@MessageMapping("/project/{pcode}")
	@SendTo("/project/{pcode}")
	public Map<String, Object> test(Map<String, Object> map) throws URISyntaxException {
		return map;
	}

}
// message : insert, type : chatcontents, object : ChatContentsVO