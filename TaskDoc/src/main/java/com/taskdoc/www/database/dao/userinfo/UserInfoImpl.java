package com.taskdoc.www.database.dao.userinfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.UserInfoVO;

@Repository
public class UserInfoImpl implements UserInfoDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "userinfo_SQL.";
	private final String INSERT = "userinfoinsert";
	private final String VIEW = "userinfoview";
	private final String UPDATE = "userinfoupdate";
	private final String DELETE = "userinfodelete";


	@Override
	public int insertUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + INSERT, userInfo);
	}

	@Override
	public UserInfoVO userInfoView(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + VIEW, userId);
	}

	@Override
	public int updateUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + UPDATE, userInfo);
	}
	
	@Override
	public int deleteUserInfo(String userId) {
		// TODO Auto-generated method stub
		 return sqlSession.delete(NAMESPACE + DELETE, userId);
	}
}
