package com.taskdoc.www.controller.restful;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;
import com.taskdoc.www.database.dto.UserInfoVO;
import com.taskdoc.www.service.chatroomjoin.ChatRoomJoinService;

@RestController
@RequestMapping("/chatroomjoin")
public class ChatRoomJoinRest {

	@Autowired
	ChatRoomJoinService service;
	
	@RequestMapping(value = "/room", method = RequestMethod.POST)
	public Map<String, Object> projectList(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		return service.roomList(chatRoomJoinVo);
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public List<UserInfoVO> userList(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		return service.userList(chatRoomJoinVo);
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public int insert(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		return service.chatRoomJoinInsert(chatRoomJoinVo);
	}

	//web용 채팅방에 유저추가하는것
	@RequestMapping(value = "/multiple", method = RequestMethod.POST)
	public List<ChatRoomJoinVO> insert(@RequestBody List<ChatRoomJoinVO> chatRoomuser) {
		return service.WebchatRoomJoinInsert(chatRoomuser);
	}
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public int delete(@RequestBody ChatRoomJoinVO chatRoomJoinVo) {
		return service.chatRoomJoinDelete(chatRoomJoinVo);
	}
}
