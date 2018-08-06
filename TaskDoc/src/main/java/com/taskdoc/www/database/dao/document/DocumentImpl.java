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
	
	private final String NAMESPACE = "document_SQL.";
	private final String DOCUMENTLIST = "documentlist";
	private final String DOCUMENTVIEW = "documentview";
	private final String DOCUMENTINSERT = "documentinsert";
	private final String DOCUMENTUPDATE = "documentupdate";
	private final String DOCUMENTDELETE = "documentdelete";
	
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
