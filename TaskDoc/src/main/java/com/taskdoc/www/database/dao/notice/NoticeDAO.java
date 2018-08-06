package com.taskdoc.www.database.dao.notice;

import java.util.List;

import com.taskdoc.www.database.dto.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> noticeList(int pcode);
	public int noticeInsert(NoticeVO notice);
	public int noticeUpdate(NoticeVO notice);
}
