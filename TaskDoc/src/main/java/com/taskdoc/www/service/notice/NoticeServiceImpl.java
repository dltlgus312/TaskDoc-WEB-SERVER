package com.taskdoc.www.service.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.notice.NoticeDAO;

@Service("NoticeService")

public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeDAO dao;
}
