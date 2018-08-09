package com.taskdoc.www.database.dao.chatroom;

import java.util.List;

import com.taskdoc.www.database.dto.ChatRoomVO;

public interface ChatRoomDAO {
	public List<ChatRoomVO> list(int tcode);
	public ChatRoomVO view(int crcode);
	public int chatRoomInsert(ChatRoomVO chatRoomVo);
	public int chatRoomUpdate(ChatRoomVO chatRoomVo);
	public int chatRoomDelete(int crcode);
}
