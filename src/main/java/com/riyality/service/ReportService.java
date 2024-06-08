package com.riyality.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientResponseDto;

public interface ReportService {

	ResponseEntity<PatientPageDto> submitShowPatientsForm(String type, String user);

	
	

}
