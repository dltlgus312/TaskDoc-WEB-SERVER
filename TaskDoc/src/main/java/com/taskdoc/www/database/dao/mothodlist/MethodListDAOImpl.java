package com.taskdoc.www.database.dao.mothodlist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.MethodListVO;

@Repository
public class MethodListDAOImpl implements MethodListDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MethodListVO> methodListList(MethodListVO methodList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int methodListInsert(MethodListVO methodList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int methodListUpdate(MethodListVO methodList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int methodListDelete(String uid, int mbcode) {
		// TODO Auto-generated method stub
		return 0;
	}
}
