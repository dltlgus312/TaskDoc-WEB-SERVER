package com.taskdoc.www.controller.restful;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.ChatRoomVO;
import com.taskdoc.www.database.dto.ProjectVO;
import com.taskdoc.www.database.dto.UserInfoVO;
import com.taskdoc.www.service.chatroom.ChatRoomService;
import com.taskdoc.www.system.JsonMapper;

@RestController
@RequestMapping("/chatroom")
public class ChatRoomRest {

	@Autowired
	ChatRoomService service;
	
	
	@RequestMapping(value = "/task/{tcode}", method = RequestMethod.GET)
	public List<ChatRoomVO> taskList(@PathVariable int tcode) {
		// TODO Auto-generated method stub
		return service.taskList(tcode);
	}

	@RequestMapping(value = "/room/{crcode}", method = RequestMethod.GET)
	public List<ChatRoomVO> roomList(@PathVariable int crcode) {
		// TODO Auto-generated method stub
		return service.roomList(crcode);
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public int insert(@RequestBody Map<String, Object> map) {
		// TODO Auto-generated method stub
		ChatRoomVO chatRoomVo = JsonMapper.mapToJson(map.get("chatRoom"), ChatRoomVO.class);
		UserInfoVO userInfoVo = JsonMapper.mapToJson(map.get("userInfo"), UserInfoVO.class);
		ProjectVO projectVo = JsonMapper.mapToJson(map.get("project"), ProjectVO.class);
		
		try {
			return service.chatRoomInsert(chatRoomVo, userInfoVo, projectVo);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public int update(@RequestBody ChatRoomVO chatRoomVo) {
		// TODO Auto-generated method stub
		return service.chatRoomUpdate(chatRoomVo);
	}
	
	@RequestMapping(value = "/{crcode}", method = RequestMethod.DELETE)
	public int delete(@PathVariable int crcode) {
		// TODO Auto-generated method stub
		return service.chatRoomDelete(crcode);
	}
}
