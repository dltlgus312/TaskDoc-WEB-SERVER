package com.taskdoc.www.service.document;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.document.DocumentDAO;

@Service("DocumentService")
public class DocumentServiceImpl implements DocumentService{

	@Autowired
	DocumentDAO dao;
}
