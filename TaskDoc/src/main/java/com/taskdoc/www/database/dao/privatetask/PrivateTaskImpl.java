package com.taskdoc.www.database.dao.privatetask;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PrivateTaskImpl implements PrivateTaskDAO {
	@Autowired
	SqlSession sqlSession;
}
