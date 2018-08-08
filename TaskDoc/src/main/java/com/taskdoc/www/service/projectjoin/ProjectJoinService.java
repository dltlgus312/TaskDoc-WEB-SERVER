package com.taskdoc.www.service.projectjoin;

import java.util.Map;

import com.taskdoc.www.database.dto.ProjectJoinVO;

public interface ProjectJoinService {
	public Map<String, Object> projectJoinList(String uid);
	public Map<String, Object> projectJoinListUser(int pcode);
	public int projectJoinInsert(ProjectJoinVO projectJoinVo);
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo);
	public int projectJoinDelete(ProjectJoinVO projectJoinVo);
}
