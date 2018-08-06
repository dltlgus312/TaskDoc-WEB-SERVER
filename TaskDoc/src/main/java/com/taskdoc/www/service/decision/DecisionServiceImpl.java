package com.taskdoc.www.service.decision;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.decision.DecisionDAO;

@Service("DecisionService")
public class DecisionServiceImpl implements DecisionService{

	@Autowired
	DecisionDAO dao;
}
