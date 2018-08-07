package com.taskdoc.www.service.userinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.userinfo.UserInfoDAO;
import com.taskdoc.www.database.dto.UserInfoVO;

@Service("UserInfoService")
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	UserInfoDAO dao;

	@Override
	public int insertUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return dao.insertUserInfo(userInfo);
	}

	@Override
	public UserInfoVO userInfoView(String userId) {
		// TODO Auto-generated method stub
		return dao.userInfoView(userId);
	}

	@Override
	public int updateUserInfo(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		return dao.updateUserInfo(userInfo);
	}

	@Override
	public int deleteUserInfo(String userId) {
		// TODO Auto-generated method stub
		return dao.deleteUserInfo(userId);
	}
}
