package com.nt.service;

import com.nt.Dto.LoggedInUserDto;
import com.nt.Dto.LoginRequestDto;
import com.nt.Dto.LoginResponceDto;

public interface LoginService {
	public LoginResponceDto login( LoginRequestDto loginDto );

	public LoggedInUserDto getLoggedInUserDetails( LoginRequestDto dto );
}
