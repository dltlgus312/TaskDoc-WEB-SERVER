package com.taskdoc.www.database.dao.methodboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.MethodBoardVO;

@Repository
public class MethodBoardDAOImpl implements MethodBoardDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MethodBoardVO> methodBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MethodBoardVO methodBoardView(int mbcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int methodBoardInsert(MethodBoardVO methodBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int methodBoardUpdate(MethodBoardVO methodBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int methodBoardDelete(int mbcode) {
		// TODO Auto-generated method stub
		return 0;
	}
}
