package com.taskdoc.www.database.dao.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	SqlSession sql;
	
	private final String NAMESPACE = "notice_SQL.";
	private final String LIST = "list";
	private final String VIEW = "view";
	private final String INSERT = "insert";
	private final String UPDATE = "update";
	private final String DELETE = "delete";

	@Override
	public List<NoticeVO> noticeList(int pcode) {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE + LIST, pcode);
	}
	
	@Override
	public NoticeVO noticeView(int ncode) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE + VIEW, ncode);
	}

	@Override
	public int noticeInsert(NoticeVO noticeVo) {
		// TODO Auto-generated method stub
		return sql.insert(NAMESPACE + INSERT, noticeVo);
	}

	@Override
	public int noticeUpdate(NoticeVO noticeVo) {
		// TODO Auto-generated method stub
		return sql.update(NAMESPACE + UPDATE, noticeVo);
	}

	@Override
	public int noticeDelete(int ncode) {
		// TODO Auto-generated method stub
		return sql.delete(NAMESPACE + DELETE, ncode);
	}
}
