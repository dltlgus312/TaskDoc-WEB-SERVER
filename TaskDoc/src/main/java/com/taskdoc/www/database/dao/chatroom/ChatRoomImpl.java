package com.taskdoc.www.database.dao.chatroom;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taskdoc.www.database.dto.ChatRoomVO;

@Repository
public class ChatRoomImpl implements ChatRoomDAO {
	@Autowired
	SqlSession sqlSession;

	private final String NAMESPACE = "chatroom.";
	private final String CHATROOMLIST = "chatRoomList";
	private final String CHATROOMVIEW = "chatRoomView";
	private final String CHATROOMINSERT = "chatRoomInsert";
	private final String CHATROOMUPDATE = "chatRoomUpdate";
	private final String CHATROOMDELETE = "chatRoomDelete";
	
	@Override
	public List<ChatRoomVO> chatRoomList(List<Integer> crcodeList, int pcode) {
		// TODO Auto-generated method stub
		List<ChatRoomVO> chatRoomList = new ArrayList<>();
		
		for(Integer i : crcodeList) {
			Map<String, Integer> map = new HashMap<>();
			map.put("crcode", i);
			map.put("pcode", pcode);
			
			chatRoomList.add(sqlSession.selectOne(NAMESPACE + CHATROOMLIST, map));
		}
		
		return chatRoomList;
	}

	@Override
	public ChatRoomVO chatRoomView(int crcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + CHATROOMVIEW, crcode);
	}

	@Override
	public int chatRoomInsert(ChatRoomVO chatRoom) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + CHATROOMINSERT, chatRoom);
	}

	@Override
	public int chatRoomUpdate(ChatRoomVO chatRoom) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + CHATROOMUPDATE, chatRoom);
	}
	
	@Override
	public int chatRoomDelete(int crcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + CHATROOMDELETE, crcode);
	}
}
