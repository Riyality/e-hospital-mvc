package com.riyality.service;

import java.util.List;

import com.riyality.Dto.patients.PatientAdmissionResponseDto;
import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientRequestDto;
import com.riyality.Dto.patients.PatientResponseDto;

public interface PatientService {

	String addPatient( PatientRequestDto dto );

	PatientPageDto allPatients( Integer branchId );

	PatientResponseDto getPatientById( long id );

	String updatePatient( PatientRequestDto dto );

	List<PatientResponseDto> findPatientsByPhoneNumber( Integer branchId, String phoneNumber );

	List<PatientAdmissionResponseDto> getAdmissionDetailsByPatient(Long id);
}
