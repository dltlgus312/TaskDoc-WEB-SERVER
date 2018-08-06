package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.userinfoVO;
import com.taskdoc.www.service.userinfo.UserInfoService;

@RestController
public class RESTfulController {

	@Autowired
	UserInfoService uservice;

	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public List<userinfoVO> selectUser(@PathVariable String id) {
		return null;
	}
	@RequestMapping(value = "/userinsert", method = RequestMethod.POST)
	public int insertUser(userinfoVO userinfoVO) {
		return 1;
	}

	@RequestMapping(value = "/userupdate", method = RequestMethod.PUT)
	public int updateUser(userinfoVO userinfoVO) {
		return 1;
	}
	
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public int deleteUser(@PathVariable String id) {
		return 1;
	}

}
