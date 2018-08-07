package com.taskdoc.www.controller.restful;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.ProjectVO;
import com.taskdoc.www.database.dto.UserInfoVO;
import com.taskdoc.www.service.project.ProjectService;

@RestController
@RequestMapping("/project")
public class ProjectRest {

	@Autowired
	ProjectService service;

	@RequestMapping(value = "/{pcode}", method = RequestMethod.GET)
	public ProjectVO selectProject(@PathVariable int pcode) {
		return service.projectView(pcode);
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public int insertProject(ProjectVO projectVo,  UserInfoVO userinfoVo) {
		try {
			return service.projectInsert(projectVo, userinfoVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public int updateProject(@RequestBody ProjectVO projectVo) {
		return service.projectUpdate(projectVo);
	}
	
	@RequestMapping(value = "/{pcode}", method = RequestMethod.DELETE)
	public int deleteProject(@PathVariable int pcode) {
		return service.projectDelete(pcode);
	}
}
