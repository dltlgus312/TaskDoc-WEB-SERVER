package com.taskdoc.www.service.privatetask;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.privatetask.PrivateTaskDAO;
import com.taskdoc.www.database.dto.PrivateTaskVO;

@Service("PrivateTaskService")

public class PrivateTaskServiceImpl implements PrivateTaskService{

	@Autowired
	PrivateTaskDAO dao;

	@Override
	public List<PrivateTaskVO> privateTaskList(int tcode) {
		// TODO Auto-generated method stub
		return dao.privateTaskList(tcode);
	}

	@Override
	public List<PrivateTaskVO> privateTaskList(String uid) {
		// TODO Auto-generated method stub
		return dao.privateTaskList(uid);
	}

	@Override
	public int privateTaskInsert(PrivateTaskVO privateTaskVo) {
		// TODO Auto-generated method stub
		return dao.privateTaskInsert(privateTaskVo);
	}

	@Override
	public int privateTaskupdate(PrivateTaskVO privateTaskVo) {
		// TODO Auto-generated method stub
		return dao.privateTaskupdate(privateTaskVo);
	}

	@Override
	public int privateTaskDelete(int ptcode) {
		// TODO Auto-generated method stub
		return dao.privateTaskDelete(ptcode);
	}
}
