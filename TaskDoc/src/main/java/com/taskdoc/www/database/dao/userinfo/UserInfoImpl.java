package com.taskdoc.www.database.dao.userinfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoImpl implements UserInfoDAO {
	@Autowired
	SqlSession sqlSession;
}
