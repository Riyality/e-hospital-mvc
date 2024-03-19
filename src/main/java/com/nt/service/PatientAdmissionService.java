package com.nt.service;

import java.util.List;

import com.nt.Dto.patients.BillRequestDto;
import com.nt.Dto.patients.DischargeResponseDto;
import com.nt.Dto.patients.PatientAdmissionRequestDto;
import com.nt.Dto.patients.PatientResponseDto;

public interface PatientAdmissionService {

	String addAdmission( PatientAdmissionRequestDto dto );

	DischargeResponseDto dischargePatient( int id );

	List<PatientResponseDto> findAllCurrentAdmissions( Integer branchId );

	String generateAndPayBill( BillRequestDto dto );

}
