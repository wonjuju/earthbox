package com.forus.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forus.domain.chatRoomVO;
import com.forus.domain.chatVO;
import com.forus.domain.goodsVO;
import com.forus.mapper.ChallengeMapper;
import com.forus.mapper.ChatMapper;
import com.forus.mapper.GoodsMapper;

@Controller
public class chatController {
	
	//List<Room> roomList = new ArrayList<Room>();
	List<chatRoomVO> roomList = new ArrayList<chatRoomVO>();
	static int roomNumber = 0;

	
	@Autowired
	GoodsMapper gMapper;
	
	@Autowired
	ChatMapper cMapper;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id != null) {
			
		List<chatRoomVO> list =cMapper.roomList(user_id);
		System.out.println(list);
		mv.addObject("chatRoomList", list);
		mv.setViewName("room");
		}
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	// g_seq 번호 가져오기
	@RequestMapping("/createRoom")
	public String createRoom(@RequestParam HashMap<Object, Object> params, HttpSession session){
		//String roomName = (String) params.get("roomName");
		String user_id = (String)session.getAttribute("user_id");
		System.out.println("user_id : " + user_id);
		
		
		int g_seq = Integer.parseInt(String.valueOf(params.get("g_seq")));
		// g_seq 값으로 제품 이미지/ 아이디 가져오기(파는 사람 user_nick 가져오기)/ 제품 이름가져오기
		//goodsVO gVO =gMapper.goodsRoom(g_seq);
		//String g_name = gVO.getG_name();
		
		chatRoomVO room = new chatRoomVO();
		
		// db에 이미 채팅방이 있는 경우 채팅 방 리스트로 뿌리기
		room=cMapper.cr_seqSelect(user_id, g_seq);
		if(room== null) {

		
		
		//if(roomName != null && !roomName.trim().equals("")) {
		if(g_seq > 0) {
			//Room room = new Room();
			
			// DB에 채팅 방 데이터 삽입  
			int row =cMapper.addChatRoom(user_id, g_seq);
			System.out.println("채팅방 데이터 DB 저장 확인 : " + row);
			
			
			// 채팅 방 정보 다 가져오기
			room = cMapper.cr_seqSelect(user_id, g_seq);
			
			System.out.println("채팅방 정보 가져오기" + room);
			
			//room.setRoomNumber(++roomNumber);
			//room.setCr_seq(cr_seq);
			//room.setRoomName(roomName);
			roomList.add(room);
			
			
		}
		}
		
		return "redirect:/moveChating?roomName="+room.getCr_title()+"&"+"roomNumber="+room.getCr_seq();
	}
	
//	/**
//	 * 방 정보가져오기 
//	 * @param params
//	 * @return
//	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<chatRoomVO> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		
//		String roomName = request.getParameter("roomName");
//		int roomNumber =  Integer.parseInt(request.getParameter("roomNumber"));
		
		//System.out.println("통신 넘어감?" + Number  + roomName);
		System.out.println("채팅방 입장");
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		List <chatVO> chatList = cMapper.chatList(roomNumber);
		System.out.println("chatList : "+chatList);
		
		
		System.out.println(roomNumber);
		List<chatRoomVO> new_list = roomList.stream().filter(o->o.getCr_seq()==roomNumber).collect(Collectors.toList());
		System.out.println( "new_list"+new_list);
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.addObject("chat", chatList);
			System.out.println(chatList);
			mv.setViewName("chat");
		}else {
			mv.setViewName("room");
		}
		System.out.println("mv : " + mv);
		return mv;
	}
	
	
	// 채팅 내용 저장
	@RequestMapping("/chatInsert.do")
	public @ResponseBody void chatInsert(chatVO vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setTalker_id(user_id);
		if (user_id != null) {
			cMapper.chatInsert(vo);
		}
		
		
	}
	
	
}