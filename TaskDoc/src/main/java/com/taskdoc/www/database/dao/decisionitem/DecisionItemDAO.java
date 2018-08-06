package com.taskdoc.www.database.dao.decisionitem;

import java.util.List;

import com.taskdoc.www.database.dto.DecisionItemVO;

public interface DecisionItemDAO {
	public List<DecisionItemVO> decisionItemList(int dscode);
	public DecisionItemVO decisionItemView(int dsicode);
	public int decisionItemInsert(DecisionItemVO decisionItem);
	public int decisionItemUpdate(DecisionItemVO decisionItem);
	public int decisionItemDelete(int dsicode);
}
