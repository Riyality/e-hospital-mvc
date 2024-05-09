package com.riyality.service;

import com.riyality.Dto.LoggedInUserDto;
import com.riyality.Dto.LoginRequestDto;
import com.riyality.Dto.LoginResponceDto;

public interface LoginService {
	public LoginResponceDto login( LoginRequestDto loginDto );

	public LoggedInUserDto getLoggedInUserDetails( LoginRequestDto dto );
}
