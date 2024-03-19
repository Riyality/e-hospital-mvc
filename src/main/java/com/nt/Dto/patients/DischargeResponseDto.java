package com.nt.Dto.patients;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.nt.Dto.cot.CotResponseDto;
import com.nt.Dto.doctors.DoctorResponseDto;
import com.nt.Dto.wards.WardResponseDto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DischargeResponseDto {

	private Long admissionId;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime admissionDate;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime dischargeDate;
	private Long admittedDays;
	private float bill;

	private WardResponseDto ward;
	private CotResponseDto cot;
	private PatientResponseDto patient;
	private DoctorResponseDto doctor;

}
