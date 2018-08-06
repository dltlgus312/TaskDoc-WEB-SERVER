package com.taskdoc.www.database.dao.chatcontents;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.ChatContentsVO;

@Repository
public class ChatContentsImpl implements ChatContentsDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "chatcontents.";
	private final String CHATCONTENTSLIST = "chatContentsList";
	private final String CHATCONTENTSINSERT = "chatContentsInsert";

	@Override
	public List<ChatContentsVO> chatContentsList(int crcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + CHATCONTENTSLIST, crcode);
	}

	@Override
	public int chatContentsInsert(ChatContentsVO chatContents) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + CHATCONTENTSINSERT, chatContents);
	}
}
