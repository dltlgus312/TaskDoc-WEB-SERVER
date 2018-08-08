package com.taskdoc.www.controller.restful;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.UserInfoVO;
import com.taskdoc.www.service.userinfo.UserInfoService;

@RestController
@RequestMapping("/userinfo")
public class UserInfoRest {

	@Autowired
	UserInfoService service;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public UserInfoVO view(@PathVariable String id) {
		return service.userInfoView(id);
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public int insert(@RequestBody UserInfoVO userinfoVO) {
		return service.insertUserInfo(userinfoVO);
	}

	@RequestMapping(value = "", method = RequestMethod.PUT)
	public int update(@RequestBody UserInfoVO userinfoVO) {
		return service.updateUserInfo(userinfoVO);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public int delete(@PathVariable String id) {
		return service.deleteUserInfo(id);
	}
}
