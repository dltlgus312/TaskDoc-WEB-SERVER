package com.taskdoc.www.database.dao.privatetask;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.PrivateTaskVO;

@Repository
public class PrivateTaskDAOImpl implements PrivateTaskDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<PrivateTaskVO> privateTaskList(String uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PrivateTaskVO privateTaskView(int ptcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int privateTaskInsert(PrivateTaskVO privateTask) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int privateTaskupdate(PrivateTaskVO privateTask) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int privateTaskDelete(int ptcode) {
		// TODO Auto-generated method stub
		return 0;
	}
}
