package com.taskdoc.www.service.publictask;

import java.util.List;
import java.util.Map;

import com.taskdoc.www.database.dto.PublicTaskVO;

public interface PublicTaskService {
	public List<PublicTaskVO> publicTaskList(int pcode);
	public Map<String, Object> publicTaskAllList(int pcode);
	public int publicTaskInsert(PublicTaskVO publicTaskVo);
	public int publicTaskUpdate(PublicTaskVO publicTaskVo);
	public int publicTaskDelete(int tcode);
}
