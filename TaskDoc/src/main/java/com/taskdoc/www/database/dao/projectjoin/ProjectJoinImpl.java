package com.taskdoc.www.database.dao.projectjoin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectJoinImpl implements ProjectJoinDAO {
	@Autowired
	SqlSession sqlSession;
}
