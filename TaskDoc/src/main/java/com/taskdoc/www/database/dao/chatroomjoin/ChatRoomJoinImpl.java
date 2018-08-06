package com.taskdoc.www.database.dao.chatroomjoin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.ChatRoomJoinVO;

@Repository
public class ChatRoomJoinImpl implements ChatRoomJoinDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "chatroomjoin.";
	private final String CHATROOMJOINLIST = "chatRoomJoinList";
	private final String CHATROOMJOININSERT = "chatRoomJoinInsert";
	private final String CHATROOMJOINDELETE = "chatRoomJoinDelete";
	
	@Override
	public List<Integer> chatRoomJoinList(String uid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + CHATROOMJOINLIST, uid);
	}

	@Override
	public int chatRoomJoinInsert(ChatRoomJoinVO chatRoomJoin) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + CHATROOMJOININSERT, chatRoomJoin);
	}

	@Override
	public int chatRoomJoinDelete(ChatRoomJoinVO chatRoomJoin) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + CHATROOMJOINDELETE, chatRoomJoin);
	}

}
