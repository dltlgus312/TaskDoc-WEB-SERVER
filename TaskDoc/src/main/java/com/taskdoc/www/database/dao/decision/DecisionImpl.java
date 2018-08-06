package com.taskdoc.www.database.dao.decision;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DecisionImpl implements DecisionDAO {
	@Autowired
	SqlSession sqlSession;
}
