package com.taskdoc.www.service.chatroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.chatroom.ChatRoomDAO;

@Service("ChatRoomService")
public class ChatRoomServiceImpl implements ChatRoomService{
	@Autowired
	ChatRoomDAO dao;
}
