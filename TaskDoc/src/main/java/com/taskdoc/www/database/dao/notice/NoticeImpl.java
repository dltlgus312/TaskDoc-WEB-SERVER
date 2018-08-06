package com.taskdoc.www.database.dao.notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeImpl implements NoticeDAO {
	@Autowired
	SqlSession sqlSession;
}
