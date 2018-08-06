package com.taskdoc.www.database.dao.document;

import java.util.List;

import com.taskdoc.www.database.dto.DocumentVO;

public interface DocumentDAO {
	public List<DocumentVO> documentList(int crcode);
	public DocumentVO documentView(int dmcode);
	public int documentInsert(DocumentVO document);
	public int documentUpdate(DocumentVO document);
	public int documentDelete(int dmcode);
}
