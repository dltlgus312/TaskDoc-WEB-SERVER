package com.taskdoc.www.database.dao.chatcontents;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatContentsImpl implements ChatContentsDAO {
	@Autowired
	SqlSession sqlSession;
}
