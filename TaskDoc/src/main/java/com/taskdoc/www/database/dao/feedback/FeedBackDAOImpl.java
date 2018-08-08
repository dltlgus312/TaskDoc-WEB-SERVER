package com.taskdoc.www.database.dao.feedback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.FeedBackVO;

@Repository
public class FeedBackDAOImpl implements FeedBackDAO {
	@Autowired
	SqlSession sqlSession;

	private final String NAMESPACE = "feedback_SQL.";
	private final String FEEDBACKLIST = "feedbacklist";
	private final String FEEDBACKVIEW = "feedbackview";
	private final String FEEDBACKINSERT = "feedbackinsert";
	private final String FEEDBACKUPDATE = "feedbackupdate";
	private final String FEEDBACKDELETE = "feedbackdelete";

	@Override
	public List<FeedBackVO> feedBackList(int dmcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + FEEDBACKLIST, dmcode);
	}

	@Override
	public FeedBackVO feedBackView(int fbcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + FEEDBACKVIEW, fbcode);
	}

	@Override
	public int feedBackInsert(FeedBackVO feedBack) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + FEEDBACKINSERT, feedBack);
	}

	@Override
	public int feedBackUpdate(FeedBackVO feedBack) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + FEEDBACKUPDATE, feedBack);
	}

	@Override
	public int feedBackDelete(FeedBackVO feedBack) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + FEEDBACKDELETE, feedBack);
	}

}
