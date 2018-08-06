package com.taskdoc.www.service.chatroomjoin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.chatroomjoin.ChatRoomJoinDAO;

@Service("ChatRoomJoinService")
public class ChatRoomJoinServiceImpl implements ChatRoomJoinService{

	@Autowired
	ChatRoomJoinDAO dao;
}
