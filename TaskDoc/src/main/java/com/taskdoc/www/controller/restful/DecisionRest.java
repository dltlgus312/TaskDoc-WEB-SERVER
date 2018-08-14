package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.DecisionVO;
import com.taskdoc.www.service.decision.DecisionService;

@RestController
@RequestMapping("/decision")
public class DecisionRest {
	
	@Autowired
	DecisionService service;
	
	@RequestMapping(value="/task/{tcode}", method = RequestMethod.GET)
	public List<DecisionVO> taskList(@PathVariable int tcode) {
		// TODO Auto-generated method stub
		return service.taskList(tcode);
	}

	@RequestMapping(value="/room/{crcode}", method = RequestMethod.GET)
	public List<DecisionVO> roomList(@PathVariable int crcode) {
		// TODO Auto-generated method stub
		return service.roomList(crcode);
	}
	

	@RequestMapping(value="", method = RequestMethod.POST)
	public int insert(@RequestBody DecisionVO decisionVo) {
		// TODO Auto-generated method stub
		return service.decisionInsert(decisionVo);
	}

	@RequestMapping(value="", method = RequestMethod.PUT)
	public int update(@RequestBody DecisionVO decision) {
		// TODO Auto-generated method stub
		return service.decisionUpdate(decision);
	}

	@RequestMapping(value="/{dscode}", method = RequestMethod.DELETE)
	public int delete(@PathVariable int dscode) {
		// TODO Auto-generated method stub
		return service.decisionDelete(dscode);
	}
}
