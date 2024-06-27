package com.riyality.Dto.patients;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PatientAdmissionResponseDto {

	private Long admissionId;
	private Long patientId;
	private Long wardId;
	private Long cotId;
	private LocalDate admissionDate;
	private LocalDate dischargeDate;
	private Long doctorId;
	private String doctorName;
	private String nextOfKinName;
	private String nextOfKinRelationship;
	private String nextOfKinPhoneNumber;
	private int branchId;
	private String admissionStatus;
	private String patientName;
	private String contact;
	//private String diagnosis;
}
