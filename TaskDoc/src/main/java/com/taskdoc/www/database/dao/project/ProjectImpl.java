package com.taskdoc.www.database.dao.project;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.ProjectVO;

@Repository
public class ProjectImpl implements ProjectDAO {
	
	private final String NAMESPACE = "project_SQL.";
	private final String INSERT = "projectinsert";
	private final String VIEW = "projectview";
	private final String UPDATE = "projectupdate";
	private final String DELETE = "projectdelete";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public ProjectVO projectView(int pcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + VIEW, pcode);
	}

	@Override
	public int projectInsert(ProjectVO project) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + INSERT, project);
	}

	@Override
	public int projectUpdate(ProjectVO project) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + UPDATE, project);
	}

	@Override
	public int projectDelete(int pcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + DELETE, pcode);
	}
}
