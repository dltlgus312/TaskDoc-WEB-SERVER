package com.taskdoc.www.database.dao.projectjoin;

import java.util.List;

import com.taskdoc.www.database.dto.ProjectJoinVO;

public interface ProjectJoinDAO {
	public List<Integer> projectJoinList(String uid);
	public int projectJoinInsert(ProjectJoinVO projectJoin);
	public int projectJoinUpdate(ProjectJoinVO projectJoin);
	public ProjectJoinVO projectJoinView(int pcode, String uid);
}
