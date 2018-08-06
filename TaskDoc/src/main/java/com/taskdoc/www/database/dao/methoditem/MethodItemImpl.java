package com.taskdoc.www.database.dao.methoditem;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.MethodItemVO;

@Repository
public class MethodItemImpl implements MethodItemDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MethodItemVO> methodItemList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MethodItemVO methodItemView(int mbcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int methodItemInsert(MethodItemVO methodBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int methodItemUpdate(MethodItemVO methodBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int methodItemDelete(int mbcode) {
		// TODO Auto-generated method stub
		return 0;
	}
}
