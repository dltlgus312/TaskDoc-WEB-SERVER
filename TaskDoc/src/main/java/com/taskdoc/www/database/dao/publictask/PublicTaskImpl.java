package com.taskdoc.www.database.dao.publictask;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PublicTaskImpl implements PublicTaskDAO {
	@Autowired
	SqlSession sqlSession;
}
