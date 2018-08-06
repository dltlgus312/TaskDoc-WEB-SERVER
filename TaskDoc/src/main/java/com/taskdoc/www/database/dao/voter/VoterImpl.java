package com.taskdoc.www.database.dao.voter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.VoterVO;

@Repository
public class VoterImpl implements VoterDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "voter_SQL.";
	private final String VOTERLIST = "voterlist";
	private final String VOTERINSERT = "voterinsert";
	private final String VOTERUPDATE = "voterupdate";
	private final String VOTERDELETE = "voterdelete";

	@Override
	public List<VoterVO> voterList(int dsicode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + VOTERLIST, dsicode);
	}

	@Override
	public int voterInsert(VoterVO voter) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + VOTERINSERT, voter);
	}

	@Override
	public int voterUpdate(VoterVO voter, int changeCode) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("voter", voter);
		map.put("changeCode", changeCode);
		return sqlSession.update(NAMESPACE + VOTERUPDATE, map);
	}

	@Override
	public int voterDelete(VoterVO voter) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + VOTERDELETE, voter);
	}

}
