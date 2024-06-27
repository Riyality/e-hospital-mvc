package com.riyality.service;

import java.util.List;

import com.riyality.Dto.patients.BillRequestDto;
import com.riyality.Dto.patients.DischargeResponseDto;
import com.riyality.Dto.patients.PatientAdmissionRequestDto;
import com.riyality.Dto.patients.PatientResponseDto;

public interface PatientAdmissionService {

	String addAdmission( PatientAdmissionRequestDto dto );

	DischargeResponseDto dischargePatient( int id );

	List<PatientResponseDto> findAllCurrentAdmissions( Integer branchId );

	String generateAndPayBill( BillRequestDto dto );

	DischargeResponseDto updateStatus(int id);

}
