package com.taskdoc.www.database.dao.chatroomjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;

public interface ChatRoomJoinDAO {
	public List<Integer> chatRoomJoinList(String uid);
	public int chatRoomJoinInsert(ChatRoomJoinVO chatRoomJoin);
	public int chatRoomJoinDelete(ChatRoomJoinVO chatRoomJoin);
}
