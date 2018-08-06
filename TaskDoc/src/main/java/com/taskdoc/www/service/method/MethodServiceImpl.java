package com.taskdoc.www.service.method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.method.MethodDAO;

@Service("MethodService")
public class MethodServiceImpl implements MethodService{

	@Autowired
	MethodDAO dao;
}
