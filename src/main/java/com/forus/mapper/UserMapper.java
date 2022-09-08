package com.forus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.forus.domain.userInfoVO;

@Mapper
public interface UserMapper {

	
		
		
	
	// login
	public userInfoVO login(userInfoVO vo);
	

	// join
	public void join(userInfoVO vo);
	
	// 중복 아이디 확인
	public String checkId(String user_id);
	
	
	// 포인트 업데이트
	public void PointUpdate(userInfoVO infoVO);
		
	
	// 포인트 값 가져오기
	public int pointSelect(String user_id);
		
}
