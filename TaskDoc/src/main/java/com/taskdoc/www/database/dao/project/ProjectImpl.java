package com.taskdoc.www.database.dao.project;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.ProjectVO;

@Repository
public class ProjectImpl implements ProjectDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ProjectVO> projectList(List<Integer> pcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectVO projectView(int pcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int projectInsert(ProjectVO project) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int projectUpdate(ProjectVO project) {
		// TODO Auto-generated method stub
		return 0;
	}
}
