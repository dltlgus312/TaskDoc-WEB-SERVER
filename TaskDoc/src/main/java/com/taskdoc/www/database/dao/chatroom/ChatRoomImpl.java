package com.taskdoc.www.database.dao.chatroom;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomImpl implements ChatRoomDAO {
	@Autowired
	SqlSession sqlSession;
}
