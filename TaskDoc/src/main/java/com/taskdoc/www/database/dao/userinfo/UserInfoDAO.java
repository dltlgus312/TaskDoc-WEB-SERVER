package com.taskdoc.www.database.dao.userinfo;

import com.taskdoc.www.database.dto.UserInfoVO;

public interface UserInfoDAO {
	public UserInfoVO userInfoView(String userId);
	public int insertUserInfo(UserInfoVO userInfo);
	public int updateUserInfo(UserInfoVO userInfo);
	public int deleteUserInfo(String userId);
}
