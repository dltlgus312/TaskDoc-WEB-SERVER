package com.taskdoc.www.service.decisionitem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.decisionitem.DecisionItemDAO;
import com.taskdoc.www.database.dto.DecisionItemVO;

@Service("DecisionItemService")
public class DecisionItemServiceImpl implements DecisionItemService{

	@Autowired
	DecisionItemDAO dao;

	@Override
	public List<DecisionItemVO> decisionItemList(int dscode) {
		// TODO Auto-generated method stub
		return dao.decisionItemList(dscode);
	}

	@Override
	public List<DecisionItemVO> decisionItemInsert(List<DecisionItemVO> itemList) {
		// TODO Auto-generated method stub
		return dao.decisionItemInsert(itemList);
	}

	@Override
	public int decisionItemUpdate(DecisionItemVO decisionItemVo) {
		// TODO Auto-generated method stub
		return dao.decisionItemUpdate(decisionItemVo);
	}

	@Override
	public int decisionItemDelete(int dsicode) {
		// TODO Auto-generated method stub
		return dao.decisionItemDelete(dsicode);
	}
}
