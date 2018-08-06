package com.taskdoc.www.database.dao.voter;

import java.util.List;

import com.taskdoc.www.database.dto.VoterVO;

public interface VoterDAO {
	public List<VoterVO> voterList(int dsicode);
	public int voterInsert(VoterVO voter);
	public int voterUpdate(VoterVO voter, int changeCode);
	public int voterDelete(VoterVO voter);
}
