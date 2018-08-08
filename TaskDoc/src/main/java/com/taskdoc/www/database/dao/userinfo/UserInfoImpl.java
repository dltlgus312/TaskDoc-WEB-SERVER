package com.taskdoc.www.database.dao.userinfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.UserInfoVO;

@Repository
public class UserInfoImpl implements UserInfoDAO {
	
	@Autowired
	SqlSession sql;
	
	private final String NAMESPACE = "userinfo_SQL.";
	private final String INSERT = "insert";
	private final String VIEW = "view";
	private final String UPDATE = "update";
	private final String DELETE = "delete";


	@Override
	public int insertUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return sql.insert(NAMESPACE + INSERT, userInfo);
	}

	@Override
	public UserInfoVO userInfoView(String userId) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + VIEW, userId);
	}

	@Override
	public int updateUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return sql.update(NAMESPACE + UPDATE, userInfo);
	}
	
	@Override
	public int deleteUserInfo(String userId) {
		// TODO Auto-generated method stub
		 return sql.delete(NAMESPACE + DELETE, userId);
	}
}
