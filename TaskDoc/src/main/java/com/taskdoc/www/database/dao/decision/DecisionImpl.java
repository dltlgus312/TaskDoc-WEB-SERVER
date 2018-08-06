package com.taskdoc.www.database.dao.decision;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.DecisionVO;

@Repository
public class DecisionImpl implements DecisionDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "decision.";
	private final String DECISIONLIST = "decisionList";
	private final String DECISIONVIEW = "decisionView";
	private final String DECISIONINSERT = "decisionInsert";
	private final String DECISIONUPDATE = "decisionUpdate";
	private final String DECISIONDELETE = "decisionDelete";
	
	@Override
	public List<DecisionVO> decisionList(int crcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + DECISIONLIST, crcode);
	}

	@Override
	public DecisionVO decisionView(int dscode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + DECISIONVIEW, dscode);
	}

	@Override
	public int decisionInsert(DecisionVO decision) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + DECISIONINSERT, decision);
	}

	@Override
	public int decisionUpdate(DecisionVO decision) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + DECISIONUPDATE, decision);
	}

	@Override
	public int decisionDelete(int dscode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + DECISIONDELETE, dscode);
	}

}
