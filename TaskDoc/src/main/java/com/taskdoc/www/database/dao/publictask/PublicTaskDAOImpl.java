package com.taskdoc.www.database.dao.publictask;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.PublicTaskVO;

@Repository
public class PublicTaskDAOImpl implements PublicTaskDAO {
	@Autowired
	SqlSession sql;
	
	private final String NAMESPACE = "publictask_SQL.";
	private final String LIST = "list";
	private final String VIEW = "view";
	private final String INSERT = "insert";
	private final String UPDATE = "update";
	private final String DELETE = "delete";
	private final String SELFREFMAX = "selfRefMax";
	private final String SAMEREFMAX = "sameRefMax";

	@Override
	public List<PublicTaskVO> publicTaskList(int pcode) {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE + LIST, pcode);
	}
	
	@Override
	public int publicTaskInsert(PublicTaskVO publicTaskVo) {
		// TODO Auto-generated method stub
		sql.insert(NAMESPACE + INSERT, publicTaskVo);
		return publicTaskVo.getTcode();
	}

	@Override
	public int publicTaskUpdate(PublicTaskVO publicTaskVo) {
		// TODO Auto-generated method stub
		return sql.update(NAMESPACE + UPDATE, publicTaskVo);
	}

	@Override
	public int publicTaskDelete(int tcode) {
		// TODO Auto-generated method stub
		return sql.delete(NAMESPACE + DELETE, tcode);
	}

	@Override
	public Integer selfRefMax(int pcode) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + SELFREFMAX, pcode);
	}

	@Override
	public Integer sameRefMax(int trefference) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + SAMEREFMAX, trefference);
	}
	
	
	@Override
	public PublicTaskVO publicTaskView(int tcode) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + VIEW, tcode);
	}
	
}
