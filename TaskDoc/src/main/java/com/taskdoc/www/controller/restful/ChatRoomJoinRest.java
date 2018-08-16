package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;
import com.taskdoc.www.database.dto.ChatRoomVO;
import com.taskdoc.www.service.chatroomjoin.ChatRoomJoinService;

@RestController
@RequestMapping("/chatroomjoin")
public class ChatRoomJoinRest {

	@Autowired
	ChatRoomJoinService service;
	
	@RequestMapping(value = "/room", method = RequestMethod.POST)
	public List<ChatRoomVO> projectList(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		// TODO Auto-generated method stub
		return service.roomList(chatRoomJoinVo);
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public List<String> userList(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		// TODO Auto-generated method stub
		return service.userList(chatRoomJoinVo);
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public int insert(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		// TODO Auto-generated method stub
		return service.chatRoomJoinInsert(chatRoomJoinVo);
	}
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public int delete(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		// TODO Auto-generated method stub
		return service.chatRoomJoinDelete(chatRoomJoinVo);
	}
}
