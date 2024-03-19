package com.nt.service;

import java.util.List;

import com.nt.Dto.patients.PatientPageDto;
import com.nt.Dto.patients.PatientRequestDto;
import com.nt.Dto.patients.PatientResponseDto;

public interface PatientService {

	String addPatient( PatientRequestDto dto );

	PatientPageDto allPatients( Integer branchId );

	PatientResponseDto getPatientById( long id );

	String updatePatient( PatientRequestDto dto );

	List<PatientResponseDto> findPatientsByPhoneNumber( Integer branchId, String phoneNumber );
}
