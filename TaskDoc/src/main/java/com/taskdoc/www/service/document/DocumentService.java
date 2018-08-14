package com.taskdoc.www.service.document;

import java.util.List;

import com.taskdoc.www.database.dto.DocumentVO;

public interface DocumentService {
	public List<DocumentVO> taskList(int tcode);
	public List<DocumentVO> roomList(int crcode);
	public int documentInsert(DocumentVO documentVo);
	public int documentUpdate(DocumentVO documentVo);
	public int documentDelete(int dmcode);
}
