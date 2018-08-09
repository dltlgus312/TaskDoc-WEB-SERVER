package com.taskdoc.www.service.chatroom;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taskdoc.www.database.dao.chatroom.ChatRoomDAO;
import com.taskdoc.www.database.dao.chatroomjoin.ChatRoomJoinDAO;
import com.taskdoc.www.database.dto.ChatRoomJoinVO;
import com.taskdoc.www.database.dto.ChatRoomVO;
import com.taskdoc.www.database.dto.ProjectVO;
import com.taskdoc.www.database.dto.UserInfoVO;

@Service("ChatRoomService")
public class ChatRoomServiceImpl implements ChatRoomService{
	
	@Autowired
	ChatRoomDAO roomDao;

	@Autowired
	ChatRoomJoinDAO joinDao;
	
	@Override
	@Transactional
	public List<ChatRoomVO> list(int tcode) {
		// TODO Auto-generated method stub
		List<ChatRoomVO> focusList = new ArrayList<>();
		List<ChatRoomVO> roomList = roomDao.list(tcode);
		
		for(ChatRoomVO vo : roomList) {
			if(vo.getCrmode() == 3) {
				focusList.add(vo);
			}
		}
		return focusList;
	}
	
	@Override
	public ChatRoomVO view(int crcode) {
		// TODO Auto-generated method stub
		return roomDao.view(crcode);
	}

	@Override
	@Transactional
	public int chatRoomInsert(ChatRoomVO chatRoomVo, UserInfoVO userInfoVo, ProjectVO projectVo) throws Exception{
		// TODO Auto-generated method stub
		roomDao.chatRoomInsert(chatRoomVo);
		
		ChatRoomJoinVO chatRoomJoinVo = new ChatRoomJoinVO();
		
		chatRoomJoinVo.setPcode(projectVo.getPcode());
		chatRoomJoinVo.setCrcode(chatRoomVo.getCrcode());
		chatRoomJoinVo.setUid(userInfoVo.getUid());
		
		
		return joinDao.chatRoomJoinInsert(chatRoomJoinVo);
	}

	@Override
	public int chatRoomUpdate(ChatRoomVO chatRoomVo) {
		// TODO Auto-generated method stub
		return roomDao.chatRoomUpdate(chatRoomVo);
	}

	@Override
	public int chatRoomDelete(int crcode) {
		// TODO Auto-generated method stub
		return roomDao.chatRoomDelete(crcode);
	}

}
