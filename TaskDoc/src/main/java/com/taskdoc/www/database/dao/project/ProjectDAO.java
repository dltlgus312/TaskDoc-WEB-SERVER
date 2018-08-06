package com.taskdoc.www.database.dao.project;

import java.util.List;

import com.taskdoc.www.database.dto.ProjectVO;

public interface ProjectDAO {
	public List<ProjectVO> projectList(List<Integer> pcode);
	public ProjectVO projectView(int pcode);
	public int projectInsert(ProjectVO project);
	public int projectUpdate(ProjectVO project);
}
