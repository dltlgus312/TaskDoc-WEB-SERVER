package com.taskdoc.www.database.dao.userinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.UserInfoVO;

@Repository
public class UserInfoImpl implements UserInfoDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "userinfo.";
	private final String SELECTLIST = "userInfoList";
	private final String INSERTUSERINFO = "userInfoInsert";
	private final String USERINFOVIEW = "userInfoView";
	private final String USERINFOUPDATE = "userInfoUpdate";

	@Override
	public List<UserInfoVO> userInfoList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + SELECTLIST);
	}

	@Override
	public int insertUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + INSERTUSERINFO, userInfo);
	}

	@Override
	public UserInfoVO userInfoView(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + USERINFOVIEW, userId);
	}

	@Override
	public void deleteUserInfo(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateUserInfo(UserInfoVO userInfo, String changeId) {
		// TODO Auto-generated method stub
		
		if(userInfo.getUid() == null && userInfo.getUpasswd() == null && userInfo.getUname() == null)
			return -1;
		
		Map<String, Object> param = new HashMap<>();
		param.put("userInfo", userInfo);
		param.put("changeId", changeId);
		
		return sqlSession.update(NAMESPACE + USERINFOUPDATE, param);
	}

	@Override
	public boolean checkPw(String userId, String upasswd) {
		UserInfoVO userInfo = sqlSession.selectOne(NAMESPACE + USERINFOVIEW, userId);
		if(userInfo == null) return false;
		else { 
			if(userInfo.getUpasswd().equals(upasswd))
				return true;
		}
		return false;
	}
}
