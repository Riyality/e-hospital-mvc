package com.riyality.Dto.patients;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.riyality.Dto.cot.CotResponseDto;
import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.wards.WardResponseDto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DischargeResponseDto {

	private Long admissionId;

	@JsonFormat(pattern="yyyy-MM-dd")
	private LocalDate admissionDate;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dischargeDate;
	private Long admittedDays;
	private float bill;

	private WardResponseDto ward;
	private CotResponseDto cot;
	private PatientResponseDto patient;
	private DoctorResponseDto doctor;

}
