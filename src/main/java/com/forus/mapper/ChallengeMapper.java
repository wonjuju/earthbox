package com.forus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forus.domain.challengeVO;
import com.forus.domain.uChallengeVO;

@Mapper
public interface ChallengeMapper {


	// 챌린지 정보 가져오기
	public List<challengeVO> challengeAll();
	
	
	// 챌린지 글 저장하기
	public int chalInsert(uChallengeVO vo);
	
	// 챌린지 모든 글 가져오기
	public List<uChallengeVO> chalListAll();
	
	// 챌린지 인증 후 포인트 지급하기
	public int addPoint(String chal_content, String user_id);
	
	
	// 챌린지 삭제
	public void chalDelete(int uc_seq);
	
	
	
	
	
}
