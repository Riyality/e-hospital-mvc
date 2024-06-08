package com.riyality.Dto.insurance;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InsuranceDetailRequestDto {

	private Long id;
	private String policyNumber;
	private String providerName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate expiryDate;

}
