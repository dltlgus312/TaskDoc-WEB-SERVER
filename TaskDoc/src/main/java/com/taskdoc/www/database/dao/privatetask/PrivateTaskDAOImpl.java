package com.taskdoc.www.database.dao.privatetask;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.PrivateTaskVO;

@Repository
public class PrivateTaskDAOImpl implements PrivateTaskDAO {
	
	@Autowired
	SqlSession sql;
	
	private final String NAMESPACE = "privatetask_SQL.";
	private final String UIDLIST = "idlist";
	private final String TCODELIST = "codelist";
	private final String INSERT = "insert";
	private final String UPDATE = "update";
	private final String DELETE = "delete";
	private final String SELFREFMAX = "selfRefMax";
	private final String SAMEREFMAX = "sameRefMax";

	@Override
	public List<PrivateTaskVO> privateTaskList(int tcode) {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE + TCODELIST, tcode);
	}

	@Override
	public List<PrivateTaskVO> privateTaskList(String uid) {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE + UIDLIST, uid);
	}

	@Override
	public int privateTaskInsert(PrivateTaskVO privateTaskVo) {
		// TODO Auto-generated method stub
		sql.insert(NAMESPACE + INSERT, privateTaskVo);
		return privateTaskVo.getPtcode();
	}

	@Override
	public int privateTaskUpdate(PrivateTaskVO privateTaskVo) {
		// TODO Auto-generated method stub
		return sql.update(NAMESPACE + UPDATE, privateTaskVo);
	}

	@Override
	public int privateTaskDelete(int ptcode) {
		// TODO Auto-generated method stub
		return sql.delete(NAMESPACE + DELETE, ptcode);
	}

	@Override
	public Integer selfRefMax(int tcode) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + SELFREFMAX, tcode);
	}

	@Override
	public Integer sameRefMax(int ptrefference) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + SAMEREFMAX, ptrefference);
	}
	
}
