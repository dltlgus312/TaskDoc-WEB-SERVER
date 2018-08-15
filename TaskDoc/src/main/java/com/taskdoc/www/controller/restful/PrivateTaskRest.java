package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.PrivateTaskVO;
import com.taskdoc.www.service.privatetask.PrivateTaskService;

@RestController
@RequestMapping("/privatetask")
public class PrivateTaskRest {

	@Autowired
	PrivateTaskService service;
	
	@RequestMapping(value = "/task/{tcode}", method = RequestMethod.GET)
	public List<PrivateTaskVO> list(@PathVariable int tcode) {
		return service.privateTaskList(tcode);
	}
	
	@RequestMapping(value = "/user/{uid}", method = RequestMethod.GET)
	public List<PrivateTaskVO> list(@PathVariable String uid) {
		return service.privateTaskList(uid);
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public int insert(@RequestBody PrivateTaskVO privateTaskVo) {
		return service.privateTaskInsert(privateTaskVo);
	}
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public int update(@RequestBody PrivateTaskVO privateTaskVo) {
		return service.privateTaskupdate(privateTaskVo);
	}
	
	@RequestMapping(value = "/{ptcode}", method = RequestMethod.DELETE)
	public int delete(@PathVariable int ptcode) {
		return service.privateTaskDelete(ptcode);
	}
}
