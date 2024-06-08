package com.riyality.serviceImpl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.service.ReportService;
@Service
 class ReportsServiceImpl implements ReportService {
	@Override
	public ResponseEntity<PatientPageDto> submitShowPatientsForm(String type,String user ) {
		
		
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/reports/"+type+"/user/"+ type ;
		
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<PatientPageDto> res = template.exchange( url, HttpMethod.GET, entity, PatientPageDto.class );
			return res;

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return null;

	
	}

	
	

}
