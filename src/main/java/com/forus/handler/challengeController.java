package com.forus.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forus.domain.gLocationVO;
import com.forus.domain.goodsVO;
import com.forus.domain.resultlocationVO;
import com.forus.domain.uChallengeVO;
import com.forus.domain.wishListVO;
import com.forus.mapper.ChallengeMapper;

@Controller
public class challengeController {
   
   @Autowired
   ChallengeMapper mapper;
   
   
   // 챌린지 인증 글 올리기
   @RequestMapping("/chalInsert.do")
   public String chalInsert(@RequestParam("c_img") MultipartFile file, HttpSession session, uChallengeVO vo, Model model) {
      
      
      String user_id=(String) session.getAttribute("user_id");
      if(user_id != null) {

      String path = session.getServletContext().getRealPath("/file");

      System.out.println("경로 : " + path);
      System.out.println("uChallengeVO 확인 "+ vo);
      
      
      
      // 이미지 저장하기
        String uuid = UUID.randomUUID().toString();
        // file upload to system
        File converFile = new File(path, uuid + file.getOriginalFilename());
        try {
         file.transferTo(converFile);
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }

        
        // 유저 챌린지 게시글 저장하기
        String msg = file.getOriginalFilename() + " is saved in server db";
        String u_img = uuid + file.getOriginalFilename();
        vo.setUc_img(u_img);
        vo.setUser_id(user_id);
   
        int row = mapper.chalInsert(vo);
        System.out.println("인증 글 추가 " + row);
        
        // 게시글 저장 후 point 지급하기
        mapper.addPoint(vo.getChal_content(), vo.getUser_id());
        
 
      
       return "redirect:/challengeList.do";
      }
      return "notPage";

	}
	
	// 챌린지 listALL 보여주기
	@RequestMapping("/challengeList.do")
	public String chalListAll(Model model, HttpSession session){
		if(session.getAttribute("user_id")!= null) {
		List<uChallengeVO> list=mapper.chalListAll();
		System.out.println(list);
		model.addAttribute("list",list);
		return "challengeList";
		}else {
			return "notPage";
		}
	}
	
	// 챌린지 listALL 보여주기
	@RequestMapping("/myChallengeList.do")
	public String myChalListAll(Model model, HttpSession session){
		if(session.getAttribute("user_id")!=null) {
		List<uChallengeVO> list=mapper.chalListAll();
		System.out.println(list);
		model.addAttribute("list",list);
		return "myChallengeList";
		}else {
			return "notPage";
		}
	}
	
	// 챌린지 삭제하기
	@RequestMapping("/chalDelete.do")
	public @ResponseBody void chalDelete(int uc_seq, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		if(user_id != null) {
		mapper.chalDelete(uc_seq);
		}
	}
	
}


