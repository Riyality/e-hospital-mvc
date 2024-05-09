package com.riyality.service;

import java.util.Arrays;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.riyality.Dto.LoggedInUserDto;
import com.riyality.Dto.LoginRequestDto;
import com.riyality.Dto.LoginResponceDto;

@Service
public class LoginServiceImpl implements LoginService {

	@Override
	public LoginResponceDto login( LoginRequestDto loginDto ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/logins";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<LoginRequestDto> request = new HttpEntity<>( loginDto, headers );
		try {
			ResponseEntity<LoginResponceDto> result = template.postForEntity( url, request, LoginResponceDto.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public LoggedInUserDto getLoggedInUserDetails( LoginRequestDto dto ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/logins/loggedin-user-details";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<LoginRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<LoggedInUserDto> result = template.exchange( url, HttpMethod.POST, request, LoggedInUserDto.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	//how to call Get method
	private void get() {
		//		RestTemplate template = new RestTemplate();
		//		HttpHeaders headers = new HttpHeaders();
		//		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		//		ResponseEntity<UserResponceDto> res = template.exchange( "url", HttpMethod.GET, entity, UserResponceDto.class );
		//		UserResponceDto result = res.getBody();
		//		System.out.println( result );
	}

	//how to get method which return list
	private void getList() {
		//		RestTemplate template = new RestTemplate();
		//		HttpHeaders headers = new HttpHeaders();
		//		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		//ParameterizedTypeReference<List<UserResponceDto>> responseType = new ParameterizedTypeReference<List<UserResponceDto>>() {};

		//		ResponseEntity<List<UserResponceDto>> res = template.exchange( "url", HttpMethod.GET, entity, responseType );
		//		UserResponceDto result = res.getBody();
		//		System.out.println( result );
	}

}
