package com.taskdoc.www.controller.restful;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.taskdoc.www.database.dto.MethodBoardVO;
import com.taskdoc.www.service.methodboard.MethodBoardService;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@RestController
@RequestMapping("/methodboard")
public class MethodBoardRest {
	
	@Autowired
	MethodBoardService service;
	
	// 게시판 목록 전체를 받아온다. ( mbcode, mbtitle, mbdate )
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public List<MethodBoardVO> list() {
		// TODO Auto-generated method stub
		return service.methodBoardList();
	}

	@RequestMapping(value="/{mbcode}", method=RequestMethod.GET)
	public MethodBoardVO view(@PathVariable int mbcode) {
		// TODO Auto-generated method stub
		return service.methodBoardView(mbcode);
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public int insert(@RequestBody MethodBoardVO methodBoard) {
		// TODO Auto-generated method stub
		return service.methodBoardInsert(methodBoard);
	}

	@RequestMapping(value="", method=RequestMethod.PUT)
	public int update(@RequestBody MethodBoardVO methodBoard) {
		// TODO Auto-generated method stub
		return service.methodBoardUpdate(methodBoard);
	}

	@RequestMapping(value="/{mbcode}", method=RequestMethod.DELETE)
	public int delete(int mbcode) {
		// TODO Auto-generated method stub
		return service.methodBoardDelete(mbcode);
	}
}
