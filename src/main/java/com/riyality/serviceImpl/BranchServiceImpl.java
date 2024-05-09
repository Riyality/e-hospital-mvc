package com.riyality.serviceImpl;

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

import com.riyality.Dto.BranchDto;
import com.riyality.Dto.BranchResponceDto;
import com.riyality.service.BranchService;

@Service
public class BranchServiceImpl implements BranchService {

	@Override
	public BranchDto getById( int id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/branch/id/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<BranchDto> res = template.exchange( url, HttpMethod.GET, entity, BranchDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public String add( BranchDto branchDto ) {

		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/superusers/branch";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<BranchDto> request = new HttpEntity<>( branchDto, headers );

		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public List<BranchResponceDto> allBranch() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/superusers/branch";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		ParameterizedTypeReference<List<BranchResponceDto>> responseType = new ParameterizedTypeReference<List<BranchResponceDto>>() {
		};
		try {

			ResponseEntity<List<BranchResponceDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;

	}

}
