package com.riyality.service;

import java.util.Arrays;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.riyality.Dto.insurance.InsuranceDetailRequestDto;
import com.riyality.Dto.insurance.InsuranceDetailResponseDto;

@Service
public class InsuranceDetailServiceImpl implements InsuranceDetailService {

	@Override
	public InsuranceDetailResponseDto findPolicy( String policyNumber ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/insurance-details/policy-number/" + policyNumber;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<InsuranceDetailResponseDto> res = template.exchange( url, HttpMethod.GET, entity, InsuranceDetailResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public InsuranceDetailResponseDto addInsurance( InsuranceDetailRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/insurance-details";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<InsuranceDetailRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<InsuranceDetailResponseDto> result = template.exchange( url, HttpMethod.POST, request, InsuranceDetailResponseDto.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
