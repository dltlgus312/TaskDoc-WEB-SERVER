package com.taskdoc.www.service.projectjoin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taskdoc.www.database.dao.projectjoin.ProjectJoinDAO;
import com.taskdoc.www.database.dao.userinfo.UserInfoDAO;
import com.taskdoc.www.database.dto.ProjectJoinVO;
import com.taskdoc.www.database.dto.UserInfoVO;

@Service("ProjectJoinService")
public class ProjectJoinServiceImpl implements ProjectJoinService{

	@Autowired
	ProjectJoinDAO joinDao;
	
	@Autowired
	UserInfoDAO userDao;

	@Override
	@Transactional
	public Map<String, Object> projectJoinListUser(int pcode) {	// 초대에 응한사람의 리스트를 받아온다.
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
		
		map.put("userList", userList);
		map.put("joinList", joinList);
		
		return map;
	}

	@Override
	public int projectJoinInsert(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
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
