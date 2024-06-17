package com.riyality.serviceImpl;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.riyality.Dto.patients.PatientAdmissionResponseDto;
import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientResponseDto;
import com.riyality.service.ReportService;
@Service
 class ReportsServiceImpl implements ReportService {
	@Override
	public List<PatientAdmissionResponseDto> submitShowPatientsForm(String type,String user ) {
		
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/reports/"+type+"/user/"+ type ;
		
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<PatientAdmissionResponseDto>> responseType = new ParameterizedTypeReference<List<PatientAdmissionResponseDto>>() {
			};
			ResponseEntity<List<PatientAdmissionResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return null;

	
	}

	
	

}
