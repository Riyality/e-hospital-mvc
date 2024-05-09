package com.riyality.Dto.patients;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PatientContent {
	private Long id;
	private String firstName;
	private String lastName;
	private String gender;
	private String address;
	private String phoneNumber;
	private String email;
	private String emergencyContactName;
	private String emergencyContactNumber;
	private String bloodType;
	private String allergies;
	private String medicalHistory;
	private String currentMedications;
	private String vaccinationHistory;
	private String nextOfKinName;
	private String nextOfKinRelationship;
	private String nextOfKinPhoneNumber;
	private String occupation;
	private String maritalStatus;
	private String nationality;
	private String languageSpoken;
	private String religion;
	private String preferredDoctor;
	private Long insuranceId;
	private int branch;
	private String admissionStatus;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime dateOfBirth;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime admissionDate;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime dischargeDate;
}
