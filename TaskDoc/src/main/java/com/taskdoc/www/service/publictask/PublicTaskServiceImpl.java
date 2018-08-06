package com.taskdoc.www.service.publictask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.publictask.PublicTaskDAO;

@Service("PublicTaskService")
public class PublicTaskServiceImpl implements PublicTaskService{

	@Autowired
	PublicTaskDAO dao;
}
