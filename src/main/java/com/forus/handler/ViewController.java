package com.forus.handler;

import java.security.PublicKey;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forus.domain.wishListVO;
import com.forus.domain.challengeVO;
import com.forus.domain.gCategoryVO;
import com.forus.mapper.ChallengeMapper;
import com.forus.mapper.GoodsMapper;
import com.forus.mapper.ViewMapper;

@Controller
public class ViewController {
	
	@Autowired
	ViewMapper mapper;
	
	@Autowired
	GoodsMapper gMapper;
	
	@Autowired
	ChallengeMapper cMapper;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}

	@RequestMapping("/viewLogin.do")
	public String login() {
		return "login";
	}

	@RequestMapping("/viewJoin.do")
	public String viewjoin() {
		return "join";
	}

	// 상품등록 click -> 카테고리 데이터 가져오기
	@RequestMapping("/viewGoodsForm.do")
	public String viewGoodsForm(Model model) {
		System.out.println("상품 등록 리스트 불러오기");
		List<gCategoryVO> result=mapper.goodsCategory();
		System.out.println("결과 "+result);
		model.addAttribute("categoryList", result);
		
		return "goodsForm";

	}
	

	@RequestMapping("viewGoodsContent.do")
	public void viewGoodsContent(int g_seq) {
		
		System.out.println(g_seq);
		
	}

	@RequestMapping("viewMypage.do")
	public String viewMypage(Model model,HttpServletRequest request) {
		
		return "mypage";
		
	}
	
	
	@RequestMapping("/updateWish.do")
	public @ResponseBody  void updateWish (HttpSession session ,int g_seq, int status) {
		
		if (session.getAttribute("user_id")!=null) {
		System.out.println(g_seq);
		// 아이디 가져오기
		String user_id = (String) session.getAttribute("user_id");
		

		wishListVO vo = new wishListVO(g_seq, user_id, status);
		
		// 찜 내용 업데이트 하기 전에 찜 기록 있는 지 확인 하고 없으며 insert 있으면 update 
		String wish_seq = null;
		wish_seq = mapper.wishCheck(vo);
		int row = 0;
			if (wish_seq !=null ) {
				// wishUpdate
				row = mapper.wishUpdate(vo);
				System.out.println("찜 내용 업데이트 완료" + row);
				
				
			}else {
				// 기록 삽입
				row = gMapper.wishInsert(vo);
				System.out.println("찜 내용 삽입" + row);
			
			}
		}
		
		
	}
	
	@RequestMapping("/viewBoard.do")
	public String viewBoard(String apt_name) {
		
		return "board";
		
	}
	
	//  게시글 작성하는 페이지 이동(카테고리 가져오기)
	@RequestMapping("/viewBoardForm.do")
	public String boardForm(Model model) {
		return "boardForm";
	}
	
	
	
	// 챌린지 인증 게시글 작성 form으로 이동
	@RequestMapping("/writeChallenge.do")
	public String writeChallenge(Model model) {
		
		List<challengeVO> vo = cMapper.challengeAll();
		System.out.println("챌린지 "+vo);
		model.addAttribute("challenge", vo);
		
		return "challengeForm";
	}
	

	
	
	
	
	
	
}
