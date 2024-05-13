package com.riyality.Dto.patients;

import java.time.LocalDateTime;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PatientRequestDto {
	private Long id;
	@NotNull
    @Size(max = 16)
	private String firstName;
	@NotNull
    @Size(max = 16)
	private String lastName;
	@NotNull
    @Size(max = 8)
	private String gender;
	@NotNull
    @Size(max = 256)
	private String address;
	@NotNull
    @Size(max = 10 ,min=10)
	private String phoneNumber;
    @Size(max = 64)
	private String email;
    @Size(max = 64)
	private String emergencyContactName;
    @Size(max = 10 , min=10)
	private String emergencyContactNumber;
    @Size(max = 4)
	private String bloodType;
    
	private String allergies;
	private String medicalHistory;
	@Size(max = 32)
	private String occupation;
	@Size(max = 16)
	private String maritalStatus;
	@Size(max = 32)
	private String nationality;
	@Size(max = 32)
	private String languageSpoken;
	@Size(max = 64)
	private String religion;
	private String preferredDoctor;
	private Long insuranceId;
	private int branch;
	private Long doctorId;

	@DateTimeFormat( pattern = "yyyy-MM-dd'T'HH:mm" )
	private LocalDateTime dateOfBirth;
	@Size(max = 32)
	private String admissionStatus;

}
