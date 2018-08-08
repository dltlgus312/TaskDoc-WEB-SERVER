package com.taskdoc.www.service.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taskdoc.www.database.dao.project.ProjectDAO;
import com.taskdoc.www.database.dao.projectjoin.ProjectJoinDAO;
import com.taskdoc.www.database.dto.ProjectJoinVO;
import com.taskdoc.www.database.dto.ProjectVO;
import com.taskdoc.www.database.dto.UserInfoVO;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	ProjectDAO projectDao;
	
	@Autowired
	ProjectJoinDAO projectJoinDao;
	
	
	@Override
	@Transactional
	public int projectInsert(ProjectVO projectVo, UserInfoVO userInfoVo) throws Exception{
		// TODO Auto-generated method stub
		projectDao.projectInsert(projectVo);
		ProjectJoinVO projectJoinVo = new ProjectJoinVO();
		projectJoinVo.setPcode(projectVo.getPcode());
		projectJoinVo.setUid(userInfoVo.getUid());
		projectJoinVo.setPpermission("OWNER");
		projectJoinVo.setPinvite(1);
		
		return projectJoinDao.projectJoinInsert(projectJoinVo);
	}

	@Override
	public int projectUpdate(ProjectVO project) {
		// TODO Auto-generated method stub
		return projectDao.projectUpdate(project);
	}

	@Override
	public int projectDelete(int pcode) {
		// TODO Auto-generated method stub
		return projectDao.projectDelete(pcode);
	}

}
