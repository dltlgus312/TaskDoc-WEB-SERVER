package com.taskdoc.www.database.dao.memo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoImpl implements MemoDAO {
	@Autowired
	SqlSession sqlSession;
}
