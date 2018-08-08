package com.taskdoc.www.database.dao.publictask;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.PublicTaskVO;

@Repository
public class PublicTaskDAOImpl implements PublicTaskDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "publictask_SQL.";
	private final String PUBLICTASKLIST = "publictasklist";
	private final String PUBLICTASKINSERT = "publictaskinsert";
	private final String PUBLICTASKVIEW = "publictaskview";
	private final String PUBLICTASKUPDATE = "publictaskupdate";
	private final String PUBLICTASKDELETE = "publictaskdelete";

	@Override
	public List<PublicTaskVO> publicTaskList(int pcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + PUBLICTASKLIST, pcode);
	}
	
	@Override
	public PublicTaskVO publicTaskView(int tcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + PUBLICTASKVIEW, tcode);
	}

	@Override
	public int publicTaskInsert(PublicTaskVO publicTask) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + PUBLICTASKINSERT, publicTask);
		return publicTask.getTcode();
	}

	@Override
	public int publicTaskUpdate(PublicTaskVO publicTask) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + PUBLICTASKUPDATE, publicTask);
	}

	@Override
	public int publicTaskDelete(int tcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + PUBLICTASKDELETE, tcode);
	}
}
