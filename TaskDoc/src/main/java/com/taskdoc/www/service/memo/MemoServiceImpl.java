package com.taskdoc.www.service.memo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.memo.MemoDAO;
import com.taskdoc.www.database.dto.MemoVO;

@Service("MemoService")
public class MemoServiceImpl implements MemoService {

	@Autowired
	MemoDAO dao;

	@Override
	public List<MemoVO> memoList(int ptcode) {
		// TODO Auto-generated method stub
		return dao.memoList(ptcode);
	}

	@Override
	public int memoInsert(MemoVO memoVo) {
		// TODO Auto-generated method stub
		return dao.memoInsert(memoVo);
	}

	@Override
	public int memoUpdate(MemoVO memoVo) {
		// TODO Auto-generated method stub
		return dao.memoUpdate(memoVo);
	}

	@Override
	public int memoDelete(int mcode) {
		// TODO Auto-generated method stub
		return dao.memoDelete(mcode);
	}
}
