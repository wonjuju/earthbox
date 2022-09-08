package com.forus.handler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.forus.domain.gLocationVO;
import com.forus.domain.goodsListVO;
import com.forus.domain.resultlocationVO;
import com.forus.mapper.GoodsMapper;
import com.forus.mapper.UserMapper;

@RestController
public class restController {

	@Autowired // self service
	UserMapper mapper;
	
	@Autowired
	GoodsMapper gmapper;

	// 아이디 중복 확인 
	@RequestMapping("/CheckId.do")
	public @ResponseBody String checkId(String user_id) {
		String result = mapper.checkId(user_id);
		
		System.out.println(result);

		return result;
	}
	
	// 제품 판매 완료 내역
	@RequestMapping("/goodsFinishList.do")
	public List<goodsListVO> goodsFinishList(HttpSession session, Model model){
		String user_id = (String)session.getAttribute("user_id");
		List<goodsListVO> list  = null;
		if(user_id != null) {
			list =gmapper.goodsFinishList(user_id);
			model.addAttribute("GoodsList", list); 
		}
		return list;
	}
	
	// 제품 판매중 내역
	@RequestMapping("/goodsSale.do")
	public List<goodsListVO> goodsSaleList(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		List<goodsListVO> list  = null;
		if(user_id != null) {
		list =gmapper.goodsSaleList(user_id);
		model.addAttribute("GoodsList", list); 
		
		}
		return list;
	}
	
	
	
	// 판매내역에서 비밀 번호 확인하기
	@RequestMapping("/pwCheck.do")
	public resultlocationVO pwCheck(int g_seq,HttpSession session) {
		resultlocationVO gVO = null;
		if(session.getAttribute("user_id")!= null){
		gVO= gmapper.gLocationSelect(g_seq);
		}
		return gVO;
	}
	
	// 카테고리 별 제품 리스트 불러오기
	@RequestMapping("/gcList.do")
	public List<goodsListVO> gcList(HttpSession session, String gc_name){
		String user_addr = (String) session.getAttribute("user_addr");
		List<goodsListVO> gList = null;
		if(user_addr != null) {
		gList =gmapper.gcList(user_addr, gc_name);
		}
		return gList;
		
	}
	
	// 제품 보관 비밀번호 확인
	@RequestMapping("/pwinfo.do")
	public resultlocationVO pwinfo(int g_seq, HttpSession session) {
		String user_id=(String)session.getAttribute("user_id");
		resultlocationVO vo = null;
		if(user_id != null) {
			vo =gmapper.gLocationSelect(g_seq);
		}
		return vo;
		
	}
	

	

	 


}
