package com.riyality.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.riyality.Dto.wards.WardRequestDto;
import com.riyality.Dto.wards.WardResponseDto;

@Service
public class WardServiceImpl implements WardService {

	@Override
	public String addWard( WardRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/wards";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<WardRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<WardResponseDto> allWards( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/wards/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<WardResponseDto>> responseType = new ParameterizedTypeReference<List<WardResponseDto>>() {
			};
			ResponseEntity<List<WardResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public WardResponseDto getWardById( long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/wards/id/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<WardResponseDto> res = template.exchange( url, HttpMethod.GET, entity, WardResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String updateWard( WardRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/wards";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<WardRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<WardResponseDto> findAvailableWards( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/wards/available-wards/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<WardResponseDto>> responseType = new ParameterizedTypeReference<List<WardResponseDto>>() {
			};
			ResponseEntity<List<WardResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
