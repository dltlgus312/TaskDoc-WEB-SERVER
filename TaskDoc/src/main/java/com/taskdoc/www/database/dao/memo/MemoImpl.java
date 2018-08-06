package com.taskdoc.www.database.dao.memo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.MemoVO;

@Repository
public class MemoImpl implements MemoDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "memo_SQL.";
	private final String MEMOLIST = "memolist";
	private final String MEMOVIEW = "memoview";
	private final String MEMOINSERT = "memoinsert";
	private final String MEMOUPDATE = "memoupdate";
	private final String MEMODELETE = "memodelete";
	
	@Override
	public List<MemoVO> memoList(int ptcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + MEMOLIST, ptcode);
	}

	@Override
	public MemoVO memoView(int mcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + MEMOVIEW, mcode);
	}

	@Override
	public int memoInsert(MemoVO memo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + MEMOINSERT, memo);
	}

	@Override
	public int memoUpdate(MemoVO memo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + MEMOUPDATE, memo);
	}

	@Override
	public int memoDelete(int mcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + MEMODELETE, mcode);
	}

}
