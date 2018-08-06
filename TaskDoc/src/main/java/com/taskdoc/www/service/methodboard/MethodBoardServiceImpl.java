package com.taskdoc.www.service.methodboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.methodboard.MethodBoardDAO;

@Service("MethodBoardService")
public class MethodBoardServiceImpl implements MethodBoardService{

	@Autowired
	MethodBoardDAO dao;
}
