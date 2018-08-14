package com.taskdoc.www.service.decision;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.decision.DecisionDAO;
import com.taskdoc.www.database.dto.DecisionVO;

@Service("DecisionService")
public class DecisionServiceImpl implements DecisionService{

	@Autowired
	DecisionDAO dao;

	@Override
	public List<DecisionVO> taskList(int tcode) {
		// TODO Auto-generated method stub
		return dao.taskList(tcode);
	}

	@Override
	public List<DecisionVO> roomList(int crcode) {
		// TODO Auto-generated method stub
		return dao.roomList(crcode);
	}
	
	@Override
	public int decisionInsert(DecisionVO decisionVo) {
		// TODO Auto-generated method stub
		return dao.decisionInsert(decisionVo);
	}

	@Override
	public int decisionUpdate(DecisionVO decisionVo) {
		// TODO Auto-generated method stub
		return dao.decisionUpdate(decisionVo);
	}

	@Override
	public int decisionDelete(int dscode) {
		// TODO Auto-generated method stub
		return dao.decisionDelete(dscode);
	}

}
