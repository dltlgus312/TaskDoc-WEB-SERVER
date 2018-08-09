package com.taskdoc.www.service.document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.document.DocumentDAO;
import com.taskdoc.www.database.dto.DocumentVO;

@Service("DocumentService")
public class DocumentServiceImpl implements DocumentService{

	@Autowired
	DocumentDAO dao;

	@Override
	public List<DocumentVO> taskList(int tcode) {
		// TODO Auto-generated method stub
		return dao.taskList(tcode);
	}

	@Override
	public List<DocumentVO> roomList(int crcode) {
		// TODO Auto-generated method stub
		return dao.roomList(crcode);
	}

	@Override
	public int documentInsert(DocumentVO documentVo) {
		// TODO Auto-generated method stub
		return dao.documentInsert(documentVo);
	}

	@Override
	public int documentUpdate(DocumentVO documentVo) {
		// TODO Auto-generated method stub
		return dao.documentUpdate(documentVo);
	}

	@Override
	public int documentDelete(int dmcode) {
		// TODO Auto-generated method stub
		return dao.documentDelete(dmcode);
	}
}
