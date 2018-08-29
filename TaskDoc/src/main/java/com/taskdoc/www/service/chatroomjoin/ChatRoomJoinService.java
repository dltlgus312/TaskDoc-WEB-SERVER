package com.taskdoc.www.service.chatroomjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;
import com.taskdoc.www.database.dto.ChatRoomVO;

public interface ChatRoomJoinService {
	public List<ChatRoomVO> roomList(ChatRoomJoinVO chatRoomJoinVo);
	public List<String> userList(ChatRoomJoinVO chatRoomJoinVo);
	public int chatRoomJoinInsert(ChatRoomJoinVO chatRoomJoinVo);
	public List<ChatRoomJoinVO> WebchatRoomJoinInsert(List<ChatRoomJoinVO> chatRoomuser);
	public int chatRoomJoinDelete(ChatRoomJoinVO chatRoomJoinVo);
}
