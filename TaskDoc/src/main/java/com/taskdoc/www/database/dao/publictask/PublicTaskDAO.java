package com.taskdoc.www.database.dao.publictask;

import java.util.List;

import com.taskdoc.www.database.dto.PublicTaskVO;

public interface PublicTaskDAO {
	public List<PublicTaskVO> publicTaskList(int pcode);
	public int publicTaskInsert(PublicTaskVO publicTaskVo);
	public int publicTaskUpdate(PublicTaskVO publicTaskVo);
	public int publicTaskDelete(int tcode);
	public Integer selfRefMax(int pcode);
	public Integer sameRefMax(int trefference);
}
