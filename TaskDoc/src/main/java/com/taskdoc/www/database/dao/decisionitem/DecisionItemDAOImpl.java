package com.taskdoc.www.database.dao.decisionitem;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.DecisionItemVO;

@Repository
public class DecisionItemDAOImpl implements DecisionItemDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "decisionitem_SQL.";
	private final String DECISIONITEMLIST = "decisionitemlist";
	private final String DECISIONITEMVIEW = "decisionitemview";
	private final String DECISIONITEMINSERT = "decisioniteminsert";
	private final String DECISIONITEMUPDATE = "decisionitemupdate";
	private final String DECISIONITEMDELETE = "decisionitemdelete";
	
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
