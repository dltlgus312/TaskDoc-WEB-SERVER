package com.taskdoc.www.service.chatcontents;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.chatcontents.ChatContentsDAO;

@Service("ChatContentsService")
public class ChatContentsServiceImpl implements ChatContentsService {

	@Autowired
	ChatContentsDAO dao;
}
