package com.forus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forus.domain.chatRoomVO;
import com.forus.domain.chatVO;

@Mapper
public interface ChatMapper {
	
	// 채팅방 데이터 삽입
	public int addChatRoom(String user_id, int g_seq);
	
	// 채팅방 정보 가져오기
	public chatRoomVO cr_seqSelect(String user_id, int g_seq);
	
	// 채팅방 리스트 가져오기
	public List<chatRoomVO> roomList(String user_id);
	
	// 채팅 내용 저장
	public void chatInsert(chatVO vo);
	
	
	// 채팅 내용 가져오기
	public List<chatVO> chatList(int cr_seq);
	
	
}
