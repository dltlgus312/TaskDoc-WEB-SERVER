package com.taskdoc.www.database.dao.methodboard;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MethodBoardImpl implements MethodBoardDAO {
	@Autowired
	SqlSession sqlSession;
}
