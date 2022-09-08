package com.forus.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forus.domain.CommunityVO;
import com.forus.domain.commentVO;
import com.forus.mapper.CommunityMapper;
import com.forus.mapper.ViewMapper;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityMapper mapper;

	
	@Autowired
	ViewMapper vMapper;
	
	// 게시글 list 
	@RequestMapping("/postList.do")
	public String postList(HttpSession session, Model model) {
		
		
		// 데이터 user_addr  값 가져오기
		String user_addr = (String) session.getAttribute("user_addr");
		if(user_addr!= null) {
		
		//회원 주소에 맞는 아파트에서 상품 리스트 불러오기
		List<CommunityVO> result = mapper.postList(user_addr);
		System.out.println("postList"+result);
		
		// 게시글 카테고리 뿌려주기
		model.addAttribute("boardList", result);
		return "board";
		}else {
			return "notPage";
		}
	}
	
	// 사용자가 작성한 게시글
	@RequestMapping("/myBoardList.do")
	public String mypostList(HttpSession session, Model model) {
		
		
		System.out.println("호롤롤로");
		// 데이터 user_addr  값 가져오기
		String user_addr = (String) session.getAttribute("user_addr");
		if(user_addr!=null) {
		
		//회원 주소에 맞는 아파트에서 게시글 리스트 불러오기
		List<CommunityVO> result = mapper.postList(user_addr);
		System.out.println("postList"+result);
		
		model.addAttribute("boardList", result);
		
		return "myBoardList";
		}else {
			return "notPage";
		}
	}
	
	
	
	// 게시글 등록
	@RequestMapping("/boardInsert.do")
	private String boardInsert(@RequestParam("img2")MultipartFile file, HttpSession session, CommunityVO vo) {
		
		if(session.getAttribute("user_id")!= null){
			// 아이디 가져오기
			String user_id = (String)session.getAttribute("user_id");
			String user_addr = (String)session.getAttribute("user_addr");
		
			System.out.println("article_category"+vo.getArticle_category());
			System.out.println("파일 가져오기 " + file.getOriginalFilename());
			System.out.println(file.getOriginalFilename().length());
			if (!file.getOriginalFilename().equals("")) {
				System.out.println("들어옴");
				// 주소 알기
				String path = session.getServletContext().getRealPath("/file");
				
				// 이미지 저장하기
				String uuid = UUID.randomUUID().toString();
				// file upload to system
				File converFile = new File(path, uuid + file.getOriginalFilename());
				try {
					file.transferTo(converFile);
				} catch (IllegalStateException |IOException e) {
					e.printStackTrace();
				} 
				
				String cFile = uuid + file.getOriginalFilename();
				vo.setArticle_file(cFile);
				}
			
		
			
			
			// V_machine_seq 알아오기
			int machine_seq =mapper.machine_seqSelect(user_addr);
			System.out.println("자판기 번호" + machine_seq);
			vo.setV_machine_seq(machine_seq);
			vo.setUser_id(user_id);
			System.out.println("user_id 넣은 후 vo : " +vo);
			
			System.out.println("vo 값 가져오기 " + vo);
			
			// 게시글 등록 mapper
			mapper.articleInsert(vo);
		
			
		}
		return "redirect:/postList.do";
	}
	
	
	// 게시글 상세페이지
	@RequestMapping("/viewBoardInfo.do")
	public String viewBoardInfo(int article_seq, HttpSession session, Model model) {
		System.out.println("article_seq:"+article_seq);
		if(session.getAttribute("user_id")!= null){
			
			CommunityVO result=mapper.communityInfo(article_seq);
			System.out.println("커뮤니티 상세정보 : "+ result);
			List<commentVO> list = mapper.commentList(article_seq);
			System.out.println("댓글 LIST 가져오기 : " + list);
			model.addAttribute("community", result);
			model.addAttribute("list", list);
			
			return"boardInfo";
		}else {
			return "notPage";
		}
	}
	
	// 댓글
	@RequestMapping("/insertComment.do")
	public @ResponseBody void insertComment(commentVO vo, HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		vo.setUser_id(user_id);
		System.out.println("vo 출력 : " + vo);
		if(user_id != null) {
			mapper.commentInsert(vo);
		}
	}
	
	// 게시글 삭제
	@RequestMapping("/deleteCommunity.do")
	public @ResponseBody void deleteCommunity(int article_seq) {
		mapper.deleteCommunity(article_seq);
	}
	
	
}
