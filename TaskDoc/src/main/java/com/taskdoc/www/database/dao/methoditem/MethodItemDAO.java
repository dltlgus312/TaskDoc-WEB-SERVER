package com.taskdoc.www.database.dao.methoditem;

import java.util.List;

import com.taskdoc.www.database.dto.MethodItemVO;

public interface MethodItemDAO {
	public List<MethodItemVO> methodItemList();
	public MethodItemVO methodItemView(int mbcode);
	public int methodItemInsert(MethodItemVO methodBoard);
	public int methodItemUpdate(MethodItemVO methodBoard);
	public int methodItemDelete(int mbcode);
}
