package com.taskdoc.www.database.dao.chatcontents;

import java.util.List;

import com.taskdoc.www.database.dto.ChatContentsVO;

public interface ChatContentsDAO {
	public List<ChatContentsVO> chatContentsList(int crcode);
	public int chatContentsInsert(ChatContentsVO chatContents);
}
