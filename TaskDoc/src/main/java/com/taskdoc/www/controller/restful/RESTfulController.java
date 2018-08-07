package com.taskdoc.www.controller.restful;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dao.userinfo.UserInfoDAO;
import com.taskdoc.www.database.dto.UserInfoVO;

@RestController
@RequestMapping("/user")
public class RESTfulController {

	@Autowired
	UserInfoDAO userInfoDao;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public UserInfoVO selectUser(@PathVariable String id) {
		return userInfoDao.userInfoView(id);
	}
	
	@RequestMapping(value = "/userinfo", method = RequestMethod.POST)
	public int insertUser(UserInfoVO userinfoVO) {
		return userInfoDao.insertUserInfo(userinfoVO);
	}

	@RequestMapping(value = "/userinfo", method = RequestMethod.PUT)
	public int updateUser(UserInfoVO userinfoVO) {
		return userInfoDao.updateUserInfo(userinfoVO);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public int deleteUser(@PathVariable String id) {
		return userInfoDao.deleteUserInfo(id);
	}
}
