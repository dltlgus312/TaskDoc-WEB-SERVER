package com.taskdoc.www.database.dao.decisionitem;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DecisionItemImpl implements DecisionItemDAO {
	@Autowired
	SqlSession sqlSession;
}
