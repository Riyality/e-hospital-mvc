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

import com.riyality.Dto.DoctorSpecializationDto;
import com.riyality.Dto.DoctorSpecializationDtoWrapper;
import com.riyality.Dto.dropdowns.MedicineTypeDto;

@Service
public class DropdownServiceImpl implements DropdownService {

	@Override
	public List<DoctorSpecializationDto> allSpecializations() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/drop-downs/specializations";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<DoctorSpecializationDto>> responseType = new ParameterizedTypeReference<List<DoctorSpecializationDto>>() {
			};
			ResponseEntity<List<DoctorSpecializationDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String addSpecialization( DoctorSpecializationDtoWrapper dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/drop-downs/specializations";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<DoctorSpecializationDtoWrapper> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<MedicineTypeDto> allMedicineTypes() {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/drop-downs/medicine-types";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<MedicineTypeDto>> responseType = new ParameterizedTypeReference<List<MedicineTypeDto>>() {
			};
			ResponseEntity<List<MedicineTypeDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
