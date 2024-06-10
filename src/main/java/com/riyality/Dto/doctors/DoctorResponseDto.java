package com.riyality.Dto.doctors;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DoctorResponseDto {
	private Long id;
	private String firstName;
	private String lastName;
	private String specialization;
	private String email;
	private String phoneNumber;
	private String address;
	private String experience;
	private String status;
	private int branch;
	private Integer consultationFee;
	private String availableDays;
	private String availableTimeSlots;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate joiningDate;
	private String qualifications;
}
