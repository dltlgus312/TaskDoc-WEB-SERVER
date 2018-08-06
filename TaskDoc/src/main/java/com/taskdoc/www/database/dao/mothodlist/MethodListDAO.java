package com.taskdoc.www.database.dao.mothodlist;

import java.util.List;

import com.taskdoc.www.database.dto.MethodListVO;

public interface MethodListDAO {
	public List<MethodListVO> methodListList(MethodListVO methodList);
	public int methodListInsert(MethodListVO methodList);
	public int methodListUpdate(MethodListVO methodList);
	public int methodListDelete(String uid, int mbcode);
}
