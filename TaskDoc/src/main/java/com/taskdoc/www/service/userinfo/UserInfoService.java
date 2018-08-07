package com.taskdoc.www.service.userinfo;

import com.taskdoc.www.database.dto.UserInfoVO;

public interface UserInfoService {
	public int insertUserInfo(UserInfoVO userInfo);
	public UserInfoVO userInfoView(String userId);
	public int updateUserInfo(UserInfoVO userInfo);
	public int deleteUserInfo(String userId);
}
