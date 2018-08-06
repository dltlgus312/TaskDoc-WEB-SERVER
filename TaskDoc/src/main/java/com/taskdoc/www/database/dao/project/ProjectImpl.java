package com.taskdoc.www.database.dao.project;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectImpl implements ProjectDAO {
	@Autowired
	SqlSession sqlSession;
}
