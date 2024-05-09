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

import com.riyality.Dto.prescriptions.MedicineResponseDto;
import com.riyality.Dto.prescriptions.PrescriptionRequestDto;
import com.riyality.Dto.prescriptions.PrescriptionResponseDto;

@Service
public class PrescriptionServiceImpl implements PrescriptionService {

	@Override
	public String addPrescription( PrescriptionRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/prescriptions";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<PrescriptionRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PrescriptionResponseDto> findAllPrescriptions( Long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/prescriptions/allPrescriptions/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<PrescriptionResponseDto>> responseType = new ParameterizedTypeReference<List<PrescriptionResponseDto>>() {
			};
			ResponseEntity<List<PrescriptionResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<MedicineResponseDto> findMedicineByPrescriptionId( Long prescriptionId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/prescriptions/medicine/" + prescriptionId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<MedicineResponseDto>> responseType = new ParameterizedTypeReference<List<MedicineResponseDto>>() {
			};
			ResponseEntity<List<MedicineResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	public List<PrescriptionResponseDto> findTopById( Long patientId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/prescriptions/lastPrescriptions/" + patientId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<PrescriptionResponseDto>> responseType = new ParameterizedTypeReference<List<PrescriptionResponseDto>>() {
			};
			ResponseEntity<List<PrescriptionResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
