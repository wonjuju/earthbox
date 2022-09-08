package com.forus.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.forus.domain.userInfoVO;
import com.forus.mapper.UserMapper;
import com.mysql.cj.Session;

import lombok.RequiredArgsConstructor;



@Controller
public class UserController {
		
	@Autowired // self service
	UserMapper mapper;
	
	


	@RequestMapping("/Login.do")
	public String userLogin(userInfoVO vo, HttpSession session) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if (mapper.login(vo) != null) {
		userInfoVO result = mapper.login(vo);
		
		// 값을 맞춰봄 
		encoder.matches(vo.getUser_pw(), result.getUser_pw());
		
			if(encoder.matches(vo.getUser_pw(), result.getUser_pw())) {
				session.setAttribute("user", result);
				return "redirect:/index.do";
			}
		}else {
			return "redirect:/viewLogin.do";
		}
		
		return "redirect:/viewLogin.do";
	}
	
	@RequestMapping("/Join.do")
	public String userJoin(userInfoVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(vo.getUser_pw());
		vo.setUser_pw(securePassword);
		mapper.join(vo);
		
		return "login";
	}
	
	@RequestMapping("/logout.do")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "main";
	}

	
	
	
	
	
}

