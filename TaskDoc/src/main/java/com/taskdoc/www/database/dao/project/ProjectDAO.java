package com.taskdoc.www.database.dao.project;

import com.taskdoc.www.database.dto.ProjectVO;

public interface ProjectDAO {
	public ProjectVO projectView(int pcode);
	public int projectInsert(ProjectVO project);
	public int projectUpdate(ProjectVO project);
	public int projectDelete(int pcode);
}
