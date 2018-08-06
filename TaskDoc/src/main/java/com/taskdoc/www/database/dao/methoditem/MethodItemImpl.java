package com.taskdoc.www.database.dao.methoditem;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MethodItemImpl implements MethodItemDAO {
	@Autowired
	SqlSession sqlSession;
}
