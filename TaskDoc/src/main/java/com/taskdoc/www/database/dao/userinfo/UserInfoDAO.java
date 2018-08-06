package com.taskdoc.www.database.dao.userinfo;

import java.util.List;

import com.taskdoc.www.database.dto.UserInfoVO;

public interface UserInfoDAO {
	public List<UserInfoVO> userInfoList();
	public int insertUserInfo(UserInfoVO userInfo);
	public UserInfoVO userInfoView(String userId);
	public void deleteUserInfo(String userId);
	public int updateUserInfo(UserInfoVO userInfo, String changeId);
	public boolean checkPw(String uid, String upasswd);
}
