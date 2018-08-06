package com.taskdoc.www.database.dao.mothodlist;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MethodListImpl implements MethodListDAO {
	@Autowired
	SqlSession sqlSession;
}
