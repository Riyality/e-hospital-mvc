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

import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientRequestDto;
import com.riyality.Dto.patients.PatientResponseDto;
import com.riyality.Dto.prescriptions.PrescriptionResponseDto;

@Service
public class PatientServiceImpl implements PatientService {

	@Override
	public String addPatient( PatientRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/patients";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<PatientRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PatientPageDto allPatients( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/patients/branch/" + branchId + "?pageNo=0";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<PatientPageDto> res = template.exchange( url, HttpMethod.GET, entity, PatientPageDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public PatientResponseDto getPatientById( long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/patients/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<PatientResponseDto> res = template.exchange( url, HttpMethod.GET, entity, PatientResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public String updatePatient( PatientRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/patients";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<PatientRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PatientResponseDto> findPatientsByPhoneNumber( Integer branchId, String phoneNumber ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/patients/branch/" + branchId + "/phoneNumber/" + phoneNumber;
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
}
