package com.forus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forus.domain.buyListVO;
import com.forus.domain.gLocationVO;
import com.forus.domain.resultlocationVO;
import com.forus.domain.goodsListVO;
import com.forus.domain.goodsPuchaseVO;
import com.forus.domain.goodsVO;
import com.forus.domain.wishListVO;

@Mapper
public interface GoodsMapper {

	
	// ALLgoodsList
	public List<goodsListVO> goodsList(String user_add);

	
	// 아파트 이름 가져오기
	public String selectAptName(String user_add);
	
	
	// goodsInfo
	public goodsVO goodsInfo(int g_seq);
	
	// goodsInsert
	public void goodsInsert(goodsVO vo);
	
	// wishlist 데이터 삽입
	public int wishInsert(wishListVO wishVO);
	
	// g_seq 번호 불러오기
	public int g_seqSelect(goodsVO vo);
	
	// loc_seq 불러오기
	public int loc_seqSelect(String user_addr);
	
	// v_machine_pw 비밀번호 update
	public int machinePwUpdate(gLocationVO gvo);
	
	// 물건 파는 사람의 nickname 불러오기
	public String seller_nickSelect(String seller_id); 
	
	// 물건 삭제
	public int goodsDelete(int g_seq);
	
	// 판매 내역 불러오기
	public List<goodsListVO> goodsSaleList(String user_id);
	
	// 판매 완료 내역
	public List<goodsListVO> goodsFinishList(String user_id);
	
	// 구입 내역
	public List<goodsListVO> goodsPurchaseList(String user_id);
	
	// 상품 구매
	public void goodsCosumerUpdate(goodsPuchaseVO vo);
	
	// g_locationVO 불러오기
	public resultlocationVO gLocationSelect(int g_seq);
	
	// 상품 구매 할때 데이터 가져오기
	public buyListVO buySelect(int g_seq);
	
	// 회원이 찜 한 리스트만 가져오기
	public List<goodsListVO> likeList(String user_id);

	// 카테고리 별 데이터 가져오기
	public List<goodsListVO> gcList(String user_addr, String gc_name);
	
	// 채팅 룸 만들기 위한 데이터 가져오기
	public goodsVO goodsRoom(int g_seq);


}	
	

