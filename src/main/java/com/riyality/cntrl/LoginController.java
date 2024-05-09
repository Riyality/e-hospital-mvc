package com.riyality.cntrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.riyality.Dto.LoginRequestDto;
import com.riyality.Dto.LoginResponceDto;
import com.riyality.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginservice;

	@GetMapping( "login" )
	public String login() {
		return "login";
	}

	@PostMapping( "/login-user" )
	public String loginUser( @ModelAttribute LoginRequestDto loginDto, Model model, HttpSession session ) {
		LoginResponceDto dto = loginservice.login( loginDto );
		if ( dto == null ) {
			model.addAttribute( "errorMsg", "invalid cred..." );
			return "login";
		} else {
			session.setAttribute( "loginId", dto.getLoginId() );
			session.setAttribute( "name", dto.getName() );
			session.setAttribute( "role", dto.getRole() );
			session.setAttribute( "username", dto.getUsername() );
			session.setAttribute( "status", dto.getStatus() );
			session.setAttribute( "branchId", dto.getBranchId() );
			session.setAttribute( "branchName", dto.getBranchName() );
			return "common/home";
		}
	}

	@GetMapping( "/logout" )
	public String logOut( HttpSession session ) {
		session.invalidate();
		return "login";
	}

}
