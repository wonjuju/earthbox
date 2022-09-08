package com.forus.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forus.domain.gCategoryVO;
import com.forus.domain.wishListVO;

@Mapper
public interface ViewMapper {
	

	public List<gCategoryVO> goodsCategory();
	
	
	public int wishUpdate(wishListVO vo);
	
	
	public String wishCheck(wishListVO vo);	
	
	
	// 제품에 대한 찜 기록 가져오기
	public String wishInfo(wishListVO vo);
	
	
}
