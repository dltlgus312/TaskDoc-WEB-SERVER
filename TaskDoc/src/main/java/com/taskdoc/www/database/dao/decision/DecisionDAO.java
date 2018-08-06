package com.taskdoc.www.database.dao.decision;

import java.util.List;

import com.taskdoc.www.database.dto.DecisionVO;

public interface DecisionDAO {
	public List<DecisionVO> decisionList(int crcode);
	public DecisionVO decisionView(int dscode);
	public int decisionInsert(DecisionVO decision);
	public int decisionUpdate(DecisionVO decision);
	public int decisionDelete(int dscode);
}
