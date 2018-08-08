package com.taskdoc.www.database.dao.method;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MethodDAOImpl implements MethodDAO {
	@Autowired
	SqlSession sqlSession;
}
