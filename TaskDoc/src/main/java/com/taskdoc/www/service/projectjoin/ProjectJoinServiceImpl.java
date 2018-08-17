package com.taskdoc.www.service.projectjoin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.project.ProjectDAO;
import com.taskdoc.www.database.dao.projectjoin.ProjectJoinDAO;
import com.taskdoc.www.database.dao.userinfo.UserInfoDAO;
import com.taskdoc.www.database.dto.ProjectJoinVO;
import com.taskdoc.www.database.dto.ProjectVO;
import com.taskdoc.www.database.dto.UserInfoVO;

@Service("ProjectJoinService")
public class ProjectJoinServiceImpl implements ProjectJoinService{

	@Autowired
	ProjectJoinDAO joinDao;
	
	@Autowired
	UserInfoDAO userDao;
	
	@Autowired
	ProjectDAO projectDao;
	
	@Override
	public Map<String, Object> projectJoinList(String uid) {
		// TODO Auto-generated method stub
		 Map<String, Object> map = new HashMap<>();
		List<ProjectVO> projectList = new ArrayList<>();
		
		List<ProjectJoinVO> projectJoinList = joinDao.projectJoinList(uid);
		
		for(ProjectJoinVO vo : projectJoinList) {
			projectList.add(projectDao.projectView(vo.getPcode()));
		}
		
		map.put("projectList", projectList);
		map.put("projectJoinList", projectJoinList);
		
		return map;
	}

	@Override
	public Map<String, Object> projectJoinListUser(int pcode) {
		// TODO Auto-generated method stub
		List<ProjectJoinVO> userJoinListAll = joinDao.projectJoinListUser(pcode);
		
		List<ProjectJoinVO> joinList = new ArrayList<>();
		List<UserInfoVO> userList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		for(ProjectJoinVO vo : userJoinListAll) {
			if(vo.getPinvite() == 1) {
				userList.add(userDao.userInfoView(vo.getUid()));
				joinList.add(vo);
			}
		}
		
		map.put("userInfoList", userList);
		map.put("projectJoinList", joinList);
		
		return map;
	}

	@Override
	public int projectJoinInsert(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		projectJoinVo.setPinvite(0);
		projectJoinVo.setPpermission("MEMBER");
		return joinDao.projectJoinInsert(projectJoinVo);
	}

	@Override
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return joinDao.projectJoinUpdate(projectJoinVo);
	}

	@Override
	public int projectJoinDelete(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return joinDao.projectJoinDelete(projectJoinVo);
	}

}
