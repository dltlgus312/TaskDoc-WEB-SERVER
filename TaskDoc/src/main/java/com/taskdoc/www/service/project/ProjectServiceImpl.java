package com.taskdoc.www.service.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.project.ProjectDAO;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	ProjectDAO dao;
}
