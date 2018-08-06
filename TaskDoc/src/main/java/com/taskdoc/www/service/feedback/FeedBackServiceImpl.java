package com.taskdoc.www.service.feedback;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.feedback.FeedBackDAO;

@Service("FeedBackService")
public class FeedBackServiceImpl implements FeedBackService{

	@Autowired
	FeedBackDAO dao;
}
