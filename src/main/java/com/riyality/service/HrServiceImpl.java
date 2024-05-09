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

import com.riyality.Dto.doctors.DoctorPageDto;
import com.riyality.Dto.doctors.DoctorRequestDto;
import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.staff.StaffRequestDto;
import com.riyality.Dto.staff.StaffResponseDto;

@Service
public class HrServiceImpl implements HrService {

	@Override
	public String addDoctor( DoctorRequestDto doctorDto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/hrs/doctors";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<DoctorRequestDto> request = new HttpEntity<>( doctorDto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public DoctorPageDto allDoctors( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/hrs/doctors/" + branchId + "?pageNo=0";
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<DoctorPageDto> res = template.exchange( url, HttpMethod.GET, entity, DoctorPageDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<DoctorResponseDto> allDoctorsList( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/hrs/all-doctors/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<DoctorResponseDto>> responseType = new ParameterizedTypeReference<List<DoctorResponseDto>>() {
			};
			ResponseEntity<List<DoctorResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public DoctorResponseDto getDoctorById( long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/hrs/doctors/id/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<DoctorResponseDto> res = template.exchange( url, HttpMethod.GET, entity, DoctorResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public String updateDoctor( DoctorRequestDto doctorDto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/hrs/doctors";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<DoctorRequestDto> request = new HttpEntity<>( doctorDto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String addStaff( StaffRequestDto staffDto ) {

		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/hrs/staffs";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<StaffRequestDto> request = new HttpEntity<>( staffDto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.POST, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<StaffResponseDto> allStaffs( Integer branchId ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/hrs/staffs/" + branchId;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {
			ParameterizedTypeReference<List<StaffResponseDto>> responseType = new ParameterizedTypeReference<List<StaffResponseDto>>() {
			};
			ResponseEntity<List<StaffResponseDto>> res = template.exchange( url, HttpMethod.GET, entity, responseType );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public String updateStaff( StaffRequestDto dto ) {
		RestTemplate template = new RestTemplate();

		String url = "http://localhost:9696/hrs/staffs";

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept( Arrays.asList( MediaType.APPLICATION_JSON ) );
		headers.setContentType( MediaType.APPLICATION_JSON );

		HttpEntity<StaffRequestDto> request = new HttpEntity<>( dto, headers );
		try {
			ResponseEntity<String> result = template.exchange( url, HttpMethod.PUT, request, String.class );
			return result.getBody();
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public StaffResponseDto selectStaffById( long id ) {
		RestTemplate template = new RestTemplate();
		String url = "http://localhost:9696/hrs/staffs/id/" + id;
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>( "body", headers );
		try {

			ResponseEntity<StaffResponseDto> res = template.exchange( url, HttpMethod.GET, entity, StaffResponseDto.class );
			return res.getBody();

		} catch ( Exception e ) {
			e.printStackTrace();
		}

		return null;
	}

}
