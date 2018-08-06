package com.taskdoc.www.service.voter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.voter.VoterDAO;

@Service("VoterService")
public class VoterServiceImpl implements VoterService{

	@Autowired
	VoterDAO dao;
}
