package com.forus.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forus.domain.buyListVO;
import com.forus.domain.gCategoryVO;
import com.forus.domain.gLocationVO;
import com.forus.domain.resultlocationVO;
import com.forus.domain.goodsListVO;
import com.forus.domain.goodsPuchaseVO;
import com.forus.domain.goodsVO;
import com.forus.domain.userInfoVO;
import com.forus.domain.wishListVO;
import com.forus.mapper.GoodsMapper;
import com.forus.mapper.UserMapper;
import com.forus.mapper.ViewMapper;

@Controller
public class GoodsController {
	
	
	
	@Autowired
	GoodsMapper mapper;
	
	@Autowired
	ViewMapper vMapper;
	
	@Autowired
	UserMapper uMapper;
	
	// 상품 리스트 불러오기
	@RequestMapping("/index.do")
	public void index(Model model ,HttpServletRequest request, HttpSession session) {
		
		// 데이터 호출하기
		userInfoVO userVO =(userInfoVO) session.getAttribute("user");
		
		if(userVO != null) {
		//회원 주소에 맞는 아파트에서 상품 리스트 불러오기
		List<goodsListVO> result = mapper.goodsList(userVO.getUser_addr());
		System.out.println("list"+result);
		
		// 회원 주소 아파트 이름 가져오기
		String apt_name = mapper.selectAptName(userVO.getUser_addr());
		System.out.println("apt_name"+apt_name);
		
		List<gCategoryVO> category=vMapper.goodsCategory();
		System.out.println("결과 "+category);
		model.addAttribute("categoryList", category);
		
		
		
		
		// 제품 리스트 보내기
		model.addAttribute("GoodsList", result);
		
		// 아파트 보내주기
		session.setAttribute("apt_name", apt_name);
		session.setAttribute("user_addr", userVO.getUser_addr());
		session.setAttribute("user_id", userVO.getUser_id());
		session.setAttribute("user_nick", userVO.getUser_nick());
		System.out.println(session.getAttribute("user_addr"));
		}
		
		
	}
	
	
	// 상품 한개 상세 정보 불러오기
	@RequestMapping("/goodsInfo.do")
	public void goodsInfo(int g_seq, HttpServletRequest request,HttpSession session) {
		
		System.out.println("상세정보 들어옴");
		
		System.out.println("g_seq :" +g_seq);
		
		String apt_name=(String)session.getAttribute("apt_name");
		if(apt_name!= null) {
		// 특정 상품 정보 불러오기
		goodsVO result =mapper.goodsInfo(g_seq);
		
		
		
		System.out.println("상세 정보 출력 " + result);
		
		
		// 아이디 불러오기
		String user_id = (String)session.getAttribute("user_id");
		wishListVO vo = new wishListVO(g_seq, user_id);
		
		String wish_yn =vMapper.wishInfo(vo);
		
		if(wish_yn == null) {
			wish_yn = "0";
		}
		
		System.out.println(wish_yn);
		System.out.println("찜 기록 : " + wish_yn);
		// 상품 정보에 nick_name 값 대입하기
		result.setSeller_nick(mapper.seller_nickSelect(result.getSeller_id()));
		System.out.println("상세정보 " +result);
	
		request.setAttribute("goodsInfo", result);
		request.setAttribute("apt_name", apt_name);
		request.setAttribute("wish", wish_yn);
	
		}
	}
	
	// 상품 등록
	@RequestMapping("/goodsInsert.do")
	public String goodsInsert(@RequestParam("g_imgg") MultipartFile file, HttpSession session, goodsVO vo, Model model) {

		if(session.getAttribute("user_id")!= null) {
		String path = session.getServletContext().getRealPath("/file");

		System.out.println("경로 : " + path);
		System.out.println("goodsvo 확인 "+ vo);
		
		// 이미지 저장하기
        String uuid = UUID.randomUUID().toString();
        // file upload to system
        File converFile = new File(path, uuid + file.getOriginalFilename());
        try {
			file.transferTo(converFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
        // 상품 등록 전에 비어있는 loc_seq 번호 중 한개 가져오기 
        int loc_seq = mapper.loc_seqSelect(vo.getUser_addr());
        System.out.println(loc_seq);
        
        // 상품 등록
        String msg = file.getOriginalFilename() + " is saved in server db";
        String g_img = uuid + file.getOriginalFilename();
        vo.setG_img(g_img);
        vo.setLoc_seq(loc_seq);
   
        mapper.goodsInsert(vo);
        
        // 상품 등록 후  wishlist에 기본 값 넣어주기
        // 1) g_seq 번호 필요
        
        int g_seq = mapper.g_seqSelect(vo);
        
        System.out.println("상품 번호 불러오기" + g_seq);
        
        wishListVO wishVO = new wishListVO(g_seq, vo.getSeller_id(),0);
        mapper.wishInsert(wishVO);
        
		// 랜덤 자판기 비밀번호 생성 
		Random rd = new Random();
		int pw = 0;
		int a = 1;
		
		for(int i = 1; i<=4 ; i++) {
			pw+= rd.nextInt(9)*a;
			a *= 10;
		}
		
		gLocationVO gvo = new gLocationVO();
		gvo.setV_machine_pw(pw);
		gvo.setLoc_seq(loc_seq);
		
		// update로 자판기 비밀번호 변경
		mapper.machinePwUpdate(gvo);
	
		
		// 상품 이름, 아파트 이름, 자판기 번호, 자판기 칸 비밀 번호 뿌려주기
		System.out.println("확인");
		resultlocationVO gVO= mapper.gLocationSelect(g_seq);
		gVO.setStatus("제품 판매");
		System.out.println("제품 판매");
    	model.addAttribute("goodsResult", gVO);
		
    	return "goodsResult";
		
		}else {
			return "notPage";
		}
		
	}

	// 상품 구입 
	@RequestMapping("/goodsPurchase.do")
	public String goodsPurchase(HttpSession session, goodsPuchaseVO vo, int user_point, Model model) {
		
		String user_id =(String)session.getAttribute("user_id");
		if(user_id != null) {
		System.out.println("유저포인트 : " + user_point);
		// 판매 -> 구매
		vo.setConsumer_id(user_id);
		mapper.goodsCosumerUpdate(vo);
		
		userInfoVO infoVO = new userInfoVO();
		infoVO.setUser_id(user_id);
		infoVO.setUser_point(user_point);
		
		if (user_point >0){
			uMapper.PointUpdate(infoVO);
		}
		
		
		resultlocationVO gVO = mapper.gLocationSelect(vo.getG_seq());
		gVO.setStatus("제품 구매");
		
		model.addAttribute("goodsResult", gVO);
		
		return"goodsResult";
		}else {
			return "notPage";
		}
		
	}
	
	
	// 제품 판매중인 내역 
	@RequestMapping("/proList.do")
	public String proList( Model model,HttpSession session) {
		System.out.println("판매중인 내역");
		if(session.getAttribute("user_id") !=null) {
		String user_id = (String) session.getAttribute("user_id");
		List<goodsListVO> list =mapper.goodsSaleList(user_id);
		model.addAttribute("GoodsList", list); 
		System.out.println("goodsList"+list);
		return "proList";
		}else {
			return "notPage";
		}
		
	}
	

	// 제품 구매 내역
	@RequestMapping("/goodsBuyList.do")
	public String goodsPurchaseList(HttpSession session, Model model){
		String user_id = (String)session.getAttribute("user_id");
		if( user_id != null) {
		List<goodsListVO> list = mapper.goodsPurchaseList(user_id);
		System.out.println(list);
		model.addAttribute("GoodsList", list); 
		}
		return "buyList";
	}
	
	// 상품 삭제 
	@RequestMapping("goodsDelete.do")
   public @ResponseBody List<goodsListVO> goodsDelete(int g_seq, HttpSession session, Model model) {
	   		String user_id = (String) session.getAttribute("user_id");
	   		if(user_id != null) {
	   		System.out.println(g_seq + "에이젝스성공");
	   		int row = 0;
	   		row = mapper.goodsDelete(g_seq);
	   		System.out.println(row);
	      
	   		}
	   		List<goodsListVO> list =mapper.goodsSaleList(user_id);
	   		model.addAttribute("GoodsList", list); 
	   		return list;
	   		
	   }
	   
   // 상품 구매 버튼 누르면 가격, 이미지, title  + 회원 포인트 값 보내주기
   @RequestMapping("/viewBuyPage.do")
   public String viewBuyPage(int g_seq, HttpSession session, Model model) {
		 
		   String user_id = (String) session.getAttribute("user_id");
		   if(user_id != null) {
			   // 상품 구매 버튼 누르면 데이터 값 가져오기
			   buyListVO buyVO = mapper.buySelect(g_seq);
			   System.out.println("buyVO" +buyVO);
			   // 회원 포인트 값 가져오기
			   int user_point = uMapper.pointSelect(user_id);
			   
			   System.out.println("회원 포인트 " + user_point);
			   
			   model.addAttribute("buyVO", buyVO);
			   model.addAttribute("user_point", user_point);
			   
			   return "buyPage";
		   }
		   
		   return "notPage";
		   
		  
		   
	}
	
   // 회원이 찜한 리스트 가져오기
   @RequestMapping("/likeList.do")
   public String likeList(HttpSession session, Model model ) {
	   // 주소 값, 아이디 값 가져오기
	   String user_id= (String)session.getAttribute("user_id");
	   if (user_id != null) {
	   System.out.println("user_id :" +user_id);
	   List<goodsListVO> likeList = mapper.likeList(user_id);
	   System.out.println(likeList);
	   model.addAttribute("GoodsList", likeList);
	   return "wishList";
	   } else {
		   return "notPage";
	   }
	   
   }
   
	
	
}
