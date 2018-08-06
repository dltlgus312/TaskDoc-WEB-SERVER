package com.taskdoc.www.database.dao.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.NoticeVO;

@Repository
public class NoticeImpl implements NoticeDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NoticeVO> noticeList(int pcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeInsert(NoticeVO notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeUpdate(NoticeVO notice) {
		// TODO Auto-generated method stub
		return 0;
	}
}
