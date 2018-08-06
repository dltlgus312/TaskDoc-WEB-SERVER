package com.taskdoc.www.service.projectjoin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.projectjoin.ProjectJoinDAO;

@Service("ProjectJoinService")
public class ProjectJoinServiceImpl implements ProjectJoinService{

	@Autowired
	ProjectJoinDAO dao;
}
