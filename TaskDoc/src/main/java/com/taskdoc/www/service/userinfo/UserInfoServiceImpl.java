package com.taskdoc.www.service.userinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.userinfo.UserInfoDAO;

@Service("UserInfoService")
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	UserInfoDAO dao;
}
