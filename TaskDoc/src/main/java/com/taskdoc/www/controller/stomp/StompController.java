package com.taskdoc.www.controller.stomp;

import java.net.URI;
import java.net.URISyntaxException;
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
		
		String urlString = "http://localhost:8080/chatcontents";
		URI uri = new URI(urlString);
		
		if (map.get("type").equals("chatcontentsvo")) {
			ChatContentsVO chatcontentsvo = JsonMapper.mapToJson(map.get("object"), ChatContentsVO.class);
			chatcontentsvo.setDmcode(0);
			chatcontentsvo.setDscode(0);
			chatcontentsvo.setCrcoderef(0);
			try {
				rest.postForObject(uri, chatcontentsvo, chatcontentsvo.getClass());
				System.out.println("DB저장 성공");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("나는 chatcontentsvo가 아니얌.");
		}
		return map;
	}

}
// message : insert, type : chatcontents, object : ChatContentsVO