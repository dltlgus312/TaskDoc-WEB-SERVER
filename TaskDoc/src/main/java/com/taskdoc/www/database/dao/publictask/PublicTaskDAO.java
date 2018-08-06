package com.taskdoc.www.database.dao.publictask;

import java.util.List;

import com.taskdoc.www.database.dto.PublicTaskVO;

public interface PublicTaskDAO {
	public List<PublicTaskVO> publicTaskList(int pcode);
	public PublicTaskVO publicTaskView(int tcode);
	public int publicTaskInsert(PublicTaskVO publicTask);
	public int publicTaskUpdate(PublicTaskVO publicTask);
	public int publicTaskDelete(int tcode);
}
