package com.taskdoc.www.database.dao.voter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoterImpl implements VoterDAO {
	@Autowired
	SqlSession sqlSession;
}
