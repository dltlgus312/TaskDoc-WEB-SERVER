package com.taskdoc.www.database.dao.projectjoin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.ProjectJoinVO;

@Repository
public class ProjectJoinImpl implements ProjectJoinDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "projectjoin_SQL.";
	private final String PROJECTJOININSERT = "projectjoininsert";
	private final String PROJECTJOINUPDATE = "projectjoinupdate";
	private final String PROJECTJOINVIEW = "projectjoinview";
	

	@Override
	public ProjectJoinVO projectJoinView(int pcode, String uid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("pcode", pcode);
		map.put("uid", uid);
		return sqlSession.selectOne(NAMESPACE + PROJECTJOINVIEW, map);
	}
	
	
	@Override
	public int projectJoinInsert(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + PROJECTJOININSERT, projectJoinVo);
	}

	@Override
	public int projectJoinUpdate(ProjectJoinVO projectJoinVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + PROJECTJOINUPDATE, projectJoinVo);
	}
}
