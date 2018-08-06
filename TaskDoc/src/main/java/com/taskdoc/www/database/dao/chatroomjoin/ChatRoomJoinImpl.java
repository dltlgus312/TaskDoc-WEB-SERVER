package com.taskdoc.www.database.dao.chatroomjoin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomJoinImpl implements ChatRoomJoinDAO {
	@Autowired
	SqlSession sqlSession;
}
