package com.taskdoc.www.database.dao.privatetask;

import java.util.List;

import com.taskdoc.www.database.dto.PrivateTaskVO;

public interface PrivateTaskDAO {
	public List<PrivateTaskVO> privateTaskList(String uid);
	public PrivateTaskVO privateTaskView(int ptcode);
	public int privateTaskInsert(PrivateTaskVO privateTask);
	public int privateTaskupdate(PrivateTaskVO privateTask);
	public int privateTaskDelete(int ptcode);
}
