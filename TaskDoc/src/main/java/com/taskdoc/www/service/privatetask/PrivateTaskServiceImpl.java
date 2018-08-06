package com.taskdoc.www.service.privatetask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.privatetask.PrivateTaskDAO;

@Service("PrivateTaskService")

public class PrivateTaskServiceImpl implements PrivateTaskService{

	@Autowired
	PrivateTaskDAO dao;
}
