package com.riyality.service;

import java.util.List;

import javax.validation.Valid;

import com.riyality.Dto.patients.TreatmentRequestDto;
import com.riyality.Dto.patients.TreatmentResponceDto;

public interface TreatmentService {
	
	
	String addTreatment(List<TreatmentRequestDto> dto);
	
	

}
