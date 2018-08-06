package com.taskdoc.www.database.dao.decisionitem;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.DecisionItemVO;

@Repository
public class DecisionItemImpl implements DecisionItemDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "decisionitem.";
	private final String DECISIONITEMLIST = "decisionItemList";
	private final String DECISIONITEMVIEW = "decisionItemView";
	private final String DECISIONITEMINSERT = "decisionItemInsert";
	private final String DECISIONITEMUPDATE = "decisionItemUpdate";
	private final String DECISIONITEMDELETE = "decisionItemDelete";
	
	@Override
	public List<DecisionItemVO> decisionItemList(int dscode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + DECISIONITEMLIST, dscode);
	}

	@Override
	public DecisionItemVO decisionItemView(int dsicode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + DECISIONITEMVIEW, dsicode);
	}

	@Override
	public int decisionItemInsert(DecisionItemVO decisionItem) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + DECISIONITEMINSERT, decisionItem);
	}

	@Override
	public int decisionItemUpdate(DecisionItemVO decisionItem) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + DECISIONITEMUPDATE, decisionItem);
	}

	@Override
	public int decisionItemDelete(int dsicode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + DECISIONITEMDELETE, dsicode);
	}
}
