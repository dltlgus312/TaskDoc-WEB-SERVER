package com.taskdoc.www.database.dao.chatroomjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;

public interface ChatRoomJoinDAO {
	public List<Integer> roomList(ChatRoomJoinVO chatRoomJoinVo);
	public List<String> userList(ChatRoomJoinVO chatRoomJoinVo);
	public int chatRoomJoinView(int crcode);
	public int chatRoomJoinInsert(ChatRoomJoinVO chatRoomJoinVo);
	public int chatRoomJoinDelete(ChatRoomJoinVO chatRoomJoinVo);
	public int crcodeMin(int pcode);
}
