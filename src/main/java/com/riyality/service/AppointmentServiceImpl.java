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

import com.riyality.Dto.appointments.AppointmentRequestDto;
import com.riyality.Dto.appointments.AppointmentResponseDto;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	@Override
	public String addAppointment( AppointmentRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/appointments";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<AppointmentRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<AppointmentResponseDto> getTodaysAppointment( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/appointments/todays/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<AppointmentResponseDto>> responseType = new ParameterizedTypeReference<List<AppointmentResponseDto>>() {
			};
			ResponseEntity<List<AppointmentResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public AppointmentResponseDto getAppointmentById( Long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/appointments/id/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<AppointmentResponseDto> res = template.exchange( url, HttpMethod.GET, entity, AppointmentResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String updateAppointment( AppointmentRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/appointments";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<AppointmentRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<AppointmentResponseDto> getTodaysAppointmentsForDoctor( Integer branchId, Long loginId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/appointments/todays/doctors/" + loginId + "/branch/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<AppointmentResponseDto>> responseType = new ParameterizedTypeReference<List<AppointmentResponseDto>>() {
			};
			ResponseEntity<List<AppointmentResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

}
