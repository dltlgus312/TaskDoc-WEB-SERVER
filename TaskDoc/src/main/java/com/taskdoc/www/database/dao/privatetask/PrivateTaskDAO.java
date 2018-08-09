package com.taskdoc.www.database.dao.privatetask;

import java.util.List;

import com.taskdoc.www.database.dto.PrivateTaskVO;

public interface PrivateTaskDAO {
	public List<PrivateTaskVO> privateTaskList(int tcode);
	public List<PrivateTaskVO> privateTaskList(String uid);
	public int privateTaskInsert(PrivateTaskVO privateTaskVo);
	public int privateTaskupdate(PrivateTaskVO privateTaskVo);
	public int privateTaskDelete(int ptcode);
}
