package com.taskdoc.www.service.project;

import com.taskdoc.www.database.dto.ProjectVO;
import com.taskdoc.www.database.dto.UserInfoVO;

public interface ProjectService {
	public ProjectVO projectView(int pcode);
	public int projectInsert(ProjectVO project, UserInfoVO userInfoVo) throws Exception;
	public int projectUpdate(ProjectVO project);
	public int projectDelete(int pcode);
}
