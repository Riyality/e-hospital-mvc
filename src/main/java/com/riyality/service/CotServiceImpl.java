package com.riyality.service;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.riyality.Dto.cot.CotRequestDto;
import com.riyality.Dto.cot.CotResponseDto;

@Service
public class CotServiceImpl implements CotService {

	@Override
	public String addCot( @Valid CotRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/cots";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<CotRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<CotResponseDto> availableCots( Long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/cots/available/wards/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<CotResponseDto>> responseType = new ParameterizedTypeReference<List<CotResponseDto>>() {
			};
			ResponseEntity<List<CotResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<CotResponseDto> allCots( Long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/cots/wards/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<CotResponseDto>> responseType = new ParameterizedTypeReference<List<CotResponseDto>>() {
			};
			ResponseEntity<List<CotResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
