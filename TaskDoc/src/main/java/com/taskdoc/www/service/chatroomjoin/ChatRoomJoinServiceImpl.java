package com.taskdoc.www.service.chatroomjoin;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskdoc.www.database.dao.chatroom.ChatRoomDAO;
import com.taskdoc.www.database.dao.chatroomjoin.ChatRoomJoinDAO;
import com.taskdoc.www.database.dto.ChatRoomJoinVO;
import com.taskdoc.www.database.dto.ChatRoomVO;

@Service("ChatRoomJoinService")
public class ChatRoomJoinServiceImpl implements ChatRoomJoinService{

	@Autowired
	ChatRoomJoinDAO joinDao;
	
	@Autowired
	ChatRoomDAO chatDao;

	@Override
	public List<ChatRoomVO> roomList(ChatRoomJoinVO chatRoomJoinVo) {
		
		List<ChatRoomVO> roomList = new ArrayList<>();
		
		List<Integer> roomCodeList = joinDao.roomList(chatRoomJoinVo);

		for(int i : roomCodeList) {
			
			ChatRoomVO chatRoom = chatDao.chatRoomView(i);

			if(chatRoom.getCrmode() != 3) {
				roomList.add(chatRoom);
			}
		
		}
		
		return roomList;
	}

	@Override
	public List<String> userList(ChatRoomJoinVO chatRoomJoinVo) {
		return joinDao.userList(chatRoomJoinVo);
	}

	@Override
	public int chatRoomJoinInsert(ChatRoomJoinVO chatRoomJoinVo) {
		return joinDao.chatRoomJoinInsert(chatRoomJoinVo);
	}

	@Override
	public int chatRoomJoinDelete(ChatRoomJoinVO chatRoomJoinVo) {
		return joinDao.chatRoomJoinDelete(chatRoomJoinVo);
	}


}
