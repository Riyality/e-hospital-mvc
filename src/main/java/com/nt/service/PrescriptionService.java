package com.nt.service;

import java.util.List;

import com.nt.Dto.prescriptions.MedicineResponseDto;
import com.nt.Dto.prescriptions.PrescriptionRequestDto;
import com.nt.Dto.prescriptions.PrescriptionResponseDto;

public interface PrescriptionService {

	String addPrescription( PrescriptionRequestDto dto );

	List<PrescriptionResponseDto> findAllPrescriptions( Long id );

	List<MedicineResponseDto> findMedicineByPrescriptionId( Long prescriptionId );

	public List<PrescriptionResponseDto> findTopById( Long patientId );
}
