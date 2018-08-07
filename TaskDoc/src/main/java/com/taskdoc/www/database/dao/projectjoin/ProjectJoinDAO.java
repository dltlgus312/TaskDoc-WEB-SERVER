package com.taskdoc.www.database.dao.projectjoin;

import com.taskdoc.www.database.dto.ProjectJoinVO;

public interface ProjectJoinDAO {
	public int projectJoinInsert(ProjectJoinVO projectJoinVo);
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo);
	public ProjectJoinVO projectJoinView(int pcode, String uid);
}
