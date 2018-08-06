package com.taskdoc.www.service.decisionitem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.decisionitem.DecisionItemDAO;

@Service("DecisionItemService")
public class DecisionItemServiceImpl implements DecisionItemService{

	@Autowired
	DecisionItemDAO dao;
}
