package com.riyality.Dto.patients;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TreatmentResponceDto {
	
	private int treatment_id;
	private String medicine_type;
	private String medicine;
	private int quantity;
	private int price;
	private LocalDate treatment_date;
	private String payment;
	private Long admission;

}
