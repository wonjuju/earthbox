package com.forus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forus.domain.CommunityVO;
import com.forus.domain.commentVO;

@Mapper
public interface CommunityMapper {
	
	
	// postList
	public List<CommunityVO> postList(String user_addr);
	
	// articleInsert
	public int articleInsert(CommunityVO vo);
	

	// v_machine_seq 번호 알아오기
	public int machine_seqSelect(String user_addr);
	
	
	// article_seq 알아오기
	public int art_seqSelect(CommunityVO vo);
	
	
	// 게시글 좋아요 값 insert
	public int likeInsert(commentVO vo);
	
	
	// 게시글 상세 정보
	public CommunityVO communityInfo(int article_seq);

	// 게시글 댓글 정보
	public List<commentVO> commentList(int article_seq);
	
	// 댓글 insert
	public int commentInsert(commentVO vo);
	
	// 게시글 삭제하기
	public void deleteCommunity(int article_seq);

}

