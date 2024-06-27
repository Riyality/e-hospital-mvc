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

import com.riyality.Dto.patients.TreatmentRequestDto;
import com.riyality.Dto.patients.TreatmentResponceDto;

@Service
public class TreatmentServiceImpl implements TreatmentService{

	
	public String addTreatment( List<TreatmentRequestDto> dto) {
	    System.out.println("SERVICE IMPL: " + dto);

	    RestTemplate template = new RestTemplate();
	    String url = "http://localhost:9696/treatments"; // Ensure this is the correct URL

	    HttpHeaders headers = new HttpHeaders();
	    headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    HttpEntity<List<TreatmentRequestDto> > request = new HttpEntity<>(dto, headers);

	    try {
	        System.out.println("Sending request to URL: " + url);
	        ResponseEntity<String> result = template.exchange(url, HttpMethod.POST, request, String.class);
	        
	        return result.getBody();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "ERROR";
	    }
	}


	
	   public List<TreatmentResponceDto> treatmentList(Long admission) {
		   RestTemplate template = new RestTemplate();
			String url = "http://localhost:9696/treatments/list/"+admission;
			HttpHeaders headers = new HttpHeaders();
			HttpEntity<String> entity = new HttpEntity<>( "body", headers );
			try {
				ParameterizedTypeReference<List<TreatmentResponceDto>> responseType = new ParameterizedTypeReference<List<TreatmentResponceDto>>() {
				};
				ResponseEntity<List<TreatmentResponceDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
				System.out.println("Response from server: " + res.getBody());
				return res.getBody();

			} catch ( Exception e ) {
				e.printStackTrace();
			}

			return null;
	    }
	


	public List<TreatmentResponceDto> getTreatmentDetails(Long admission) {
		 RestTemplate template = new RestTemplate();
			String url = "http://localhost:9696/treatments/list/"+admission;
			HttpHeaders headers = new HttpHeaders();
			HttpEntity<String> entity = new HttpEntity<>( "body", headers );
			try {
				ParameterizedTypeReference<List<TreatmentResponceDto>> responseType = new ParameterizedTypeReference<List<TreatmentResponceDto>>() {
				};
				ResponseEntity<List<TreatmentResponceDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
				
				return res.getBody();

			} catch ( Exception e ) {
				e.printStackTrace();
			}

			return null;
	}



}
