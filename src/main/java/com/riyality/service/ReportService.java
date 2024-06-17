package com.riyality.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.riyality.Dto.patients.PatientAdmissionResponseDto;
import com.riyality.Dto.patients.PatientContent;
import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientResponseDto;

public interface ReportService {

	List<PatientAdmissionResponseDto> submitShowPatientsForm(String type, String user);

	
	

}
