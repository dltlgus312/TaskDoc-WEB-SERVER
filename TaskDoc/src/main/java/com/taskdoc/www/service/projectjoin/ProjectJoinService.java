package com.taskdoc.www.service.projectjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ProjectJoinVO;

public interface ProjectJoinService {
	public List<ProjectJoinVO> projectJoinList(String uid);
	public List<ProjectJoinVO> projectJoinListUser(int pcode);
	public int projectJoinInsert(ProjectJoinVO projectJoinVo);
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo);
	public int projectJoinDelete(ProjectJoinVO projectJoinVo);
}
