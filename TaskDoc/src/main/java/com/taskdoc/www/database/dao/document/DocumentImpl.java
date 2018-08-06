package com.taskdoc.www.database.dao.document;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.DocumentVO;

@Repository
public class DocumentImpl implements DocumentDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "document.";
	private final String DOCUMENTLIST = "documentList";
	private final String DOCUMENTVIEW = "documentView";
	private final String DOCUMENTINSERT = "documentInsert";
	private final String DOCUMENTUPDATE = "documentUpdate";
	private final String DOCUMENTDELETE = "documentDelete";
	
	@Override
	public List<DocumentVO> documentList(int crcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + DOCUMENTLIST, crcode);
	}

	@Override
	public DocumentVO documentView(int dmcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + DOCUMENTVIEW, dmcode);
	}

	@Override
	public int documentInsert(DocumentVO document) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + DOCUMENTINSERT, document);
	}

	@Override
	public int documentUpdate(DocumentVO document) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + DOCUMENTUPDATE, document);
	}

	@Override
	public int documentDelete(int dmcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + DOCUMENTDELETE, dmcode);
	}
}
