package com.taskdoc.www.service.methoditem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.methoditem.MethodItemDAO;

@Service("MethodItemService")

public class MethodItemServiceImpl implements MethodItemService{

	@Autowired
	MethodItemDAO dao;
}
