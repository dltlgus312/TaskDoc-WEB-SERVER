package com.taskdoc.www.database.dao.chatroom;

import java.util.List;

import com.taskdoc.www.database.dto.ChatRoomVO;

public interface ChatRoomDAO {
	public List<ChatRoomVO> chatRoomList(List<Integer> crcodeList, int pcode);
	public ChatRoomVO chatRoomView(int crcode);
	public int chatRoomInsert(ChatRoomVO chatRoom);
	public int chatRoomUpdate(ChatRoomVO chatRoom);
	public int chatRoomDelete(int crcode);
}
