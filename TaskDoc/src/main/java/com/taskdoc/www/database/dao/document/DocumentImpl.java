package com.taskdoc.www.database.dao.document;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentImpl implements DocumentDAO {
	@Autowired
	SqlSession sqlSession;
}
