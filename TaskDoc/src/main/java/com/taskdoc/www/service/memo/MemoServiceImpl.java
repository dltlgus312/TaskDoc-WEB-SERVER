package com.taskdoc.www.service.memo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.memo.MemoDAO;

@Service("MemoService")
public class MemoServiceImpl implements MemoService {

	@Autowired
	MemoDAO dao;
}
