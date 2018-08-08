package com.taskdoc.www.database.dao.projectjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ProjectJoinVO;

public interface ProjectJoinDAO {
	public List<ProjectJoinVO> projectJoinList(String uid);
	public List<ProjectJoinVO> projectJoinListUser(int pcode);
	public int projectJoinInsert(ProjectJoinVO projectJoinVo);
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo);
	public int projectJoinDelete(ProjectJoinVO projectJoinVo);
}
