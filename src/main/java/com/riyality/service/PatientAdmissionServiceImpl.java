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

import com.riyality.Dto.patients.BillRequestDto;
import com.riyality.Dto.patients.DischargeResponseDto;
import com.riyality.Dto.patients.PatientAdmissionRequestDto;
import com.riyality.Dto.patients.PatientResponseDto;

@Service
public class PatientAdmissionServiceImpl implements PatientAdmissionService {

	@Override
	public String addAdmission( PatientAdmissionRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/admissions";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<PatientAdmissionRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public DischargeResponseDto dischargePatient( int id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/admissions/discharge-info/patient/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<DischargeResponseDto> res = template.exchange( url, HttpMethod.GET, entity, DischargeResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<PatientResponseDto> findAllCurrentAdmissions( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/admissions/current-admissions/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<PatientResponseDto>> responseType = new ParameterizedTypeReference<List<PatientResponseDto>>() {
			};
			ResponseEntity<List<PatientResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public String generateAndPayBill( BillRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/admissions/bills/admissions";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<BillRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
