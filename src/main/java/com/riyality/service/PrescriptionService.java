package com.riyality.service;

import java.util.List;

import com.riyality.Dto.prescriptions.MedicineResponseDto;
import com.riyality.Dto.prescriptions.PrescriptionRequestDto;
import com.riyality.Dto.prescriptions.PrescriptionResponseDto;

public interface PrescriptionService {

	String addPrescription( PrescriptionRequestDto dto );

	List<PrescriptionResponseDto> findAllPrescriptions( Long id );

	List<MedicineResponseDto> findMedicineByPrescriptionId( Long prescriptionId );

	public List<PrescriptionResponseDto> findTopById( Long patientId );
}
