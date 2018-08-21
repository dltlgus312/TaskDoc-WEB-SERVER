package com.taskdoc.www.database.dao.chatroomjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;

public interface ChatRoomJoinDAO {
	public List<Integer> roomList(ChatRoomJoinVO chatRoomJoinVo);
	public List<String> userList(ChatRoomJoinVO chatRoomJoinVo);
	public List<ChatRoomJoinVO> chatRoomJoinInsert(List<ChatRoomJoinVO> chatRoomuser);
	public int chatRoomJoinDelete(ChatRoomJoinVO chatRoomJoinVo);
	public int crcodeMin(int pcode);
}
