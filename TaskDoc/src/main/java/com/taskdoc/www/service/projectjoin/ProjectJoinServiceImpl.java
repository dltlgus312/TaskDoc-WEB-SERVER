package com.taskdoc.www.service.projectjoin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.projectjoin.ProjectJoinDAO;
import com.taskdoc.www.database.dto.ProjectJoinVO;

@Service("ProjectJoinService")
public class ProjectJoinServiceImpl implements ProjectJoinService{

	@Autowired
	ProjectJoinDAO dao;

	@Override
	public List<ProjectJoinVO> projectJoinList(String uid) {
		// TODO Auto-generated method stub
		return dao.projectJoinList(uid);
	}
	
	@Override
	public List<ProjectJoinVO> projectJoinListUser(int pcode) {
		// TODO Auto-generated method stub
		return dao.projectJoinListUser(pcode);
	}

	@Override
	public int projectJoinInsert(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return dao.projectJoinInsert(projectJoinVo);
	}

	@Override
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return dao.projectJoinUpdate(projectJoinVo);
	}

	@Override
	public int projectJoinDelete(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return dao.projectJoinDelete(projectJoinVo);
	}

}
