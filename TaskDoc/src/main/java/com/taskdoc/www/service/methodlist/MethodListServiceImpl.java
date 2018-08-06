package com.taskdoc.www.service.methodlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.mothodlist.MethodListDAO;

@Service("MethodListService")

public class MethodListServiceImpl implements MethodListService{

	@Autowired
	MethodListDAO dao;
}
