package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.DecisionItemVO;
import com.taskdoc.www.service.decisionitem.DecisionItemService;

@RestController
@RequestMapping("/decisionitem")
public class DecisionItemRest {
	
	@Autowired
	DecisionItemService service;
	
	@RequestMapping(value="/{dscode}", method = RequestMethod.GET)
	public List<DecisionItemVO> list(@PathVariable int dscode) {
		// TODO Auto-generated method stub
		return service.decisionItemList(dscode);
	}
	

	@RequestMapping(value="", method = RequestMethod.POST)
	public List<DecisionItemVO> decisionInsert(@RequestBody List<DecisionItemVO> itemList) {
		// TODO Auto-generated method stub
		return service.decisionItemInsert(itemList);
	}

	@RequestMapping(value="", method = RequestMethod.PUT)
	public int decisionUpdate(@RequestBody DecisionItemVO decisionItemVo) {
		// TODO Auto-generated method stub
		return service.decisionItemUpdate(decisionItemVo);
	}

	@RequestMapping(value="/{dsicode}", method = RequestMethod.DELETE)
	public int decisionDelete(@PathVariable int dsicode) {
		// TODO Auto-generated method stub
		return service.decisionItemDelete(dsicode);
	}
}
