package com.taskdoc.www.service.chatcontents;

import java.util.List;

import com.taskdoc.www.database.dto.ChatContentsVO;

public interface ChatContentsService {
	public List<ChatContentsVO> chatContentsList(int crcode);
	public int chatContentsInsert(ChatContentsVO chatContentsVo);
}
