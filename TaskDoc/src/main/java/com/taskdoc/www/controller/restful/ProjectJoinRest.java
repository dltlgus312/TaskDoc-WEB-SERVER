package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.ProjectJoinVO;
import com.taskdoc.www.service.projectjoin.ProjectJoinService;

@RestController
@RequestMapping("/projectjoin")
public class ProjectJoinRest {

	@Autowired
	ProjectJoinService service;

	// 한 회원이 참가하는 프로젝트의 리스트
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public List<ProjectJoinVO> listProject(@PathVariable String id) {
		return service.projectJoinList(id);
	}
	
	// 프로젝트에 참가하는 모든 회원을 검색
	@RequestMapping(value = "/collaboration/{pcode}", method = RequestMethod.GET)
	public List<ProjectJoinVO> listUser(@PathVariable int pcode) {
		return service.projectJoinListUser(pcode);
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public int insert(@RequestBody ProjectJoinVO projectJoinVo) {
		return service.projectJoinInsert(projectJoinVo);
	}

	@RequestMapping(value = "", method = RequestMethod.PUT)
	public int update(@RequestBody ProjectJoinVO projectJoinVo) {
		return service.projectJoinUpdate(projectJoinVo);
	}
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public int delete(@RequestBody ProjectJoinVO projectJoinVo) {
		return service.projectJoinDelete(projectJoinVo);
	}
}
