package com.taskdoc.www.service.methodboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.methodboard.MethodBoardDAO;
import com.taskdoc.www.database.dto.MethodBoardVO;

@Service("MethodBoardService")
public class MethodBoardServiceImpl implements MethodBoardService{

	@Autowired
	MethodBoardDAO dao;

	@Override
	public List<MethodBoardVO> methodBoardList() {
		// TODO Auto-generated method stub
		return dao.methodBoardList();
	}

	@Override
	public MethodBoardVO methodBoardView(int mbcode) {
		// TODO Auto-generated method stub
		return dao.methodBoardView(mbcode);
	}

	@Override
	public int methodBoardInsert(MethodBoardVO methodBoard) {
		// TODO Auto-generated method stub
		return dao.methodBoardInsert(methodBoard);
	}

	@Override
	public int methodBoardUpdate(MethodBoardVO methodBoard) {
		// TODO Auto-generated method stub
		return dao.methodBoardUpdate(methodBoard);
	}

	@Override
	public int methodBoardDelete(int mbcode) {
		// TODO Auto-generated method stub
		return dao.methodBoardDelete(mbcode);
	}
}
