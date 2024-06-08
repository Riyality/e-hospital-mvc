package com.riyality.Dto.patients;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.riyality.Dto.cot.CotResponseDto;
import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.wards.WardResponseDto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DischargeResponseDto {

	private Long admissionId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDateTime admissionDate;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dischargeDate;
	private Long admittedDays;
	private float bill;

	private WardResponseDto ward;
	private CotResponseDto cot;
	private PatientResponseDto patient;
	private DoctorResponseDto doctor;

}
