package com.riyality.service;

import com.riyality.Dto.insurance.InsuranceDetailRequestDto;
import com.riyality.Dto.insurance.InsuranceDetailResponseDto;

public interface InsuranceDetailService {

	InsuranceDetailResponseDto findPolicy( String policyNumber );

	InsuranceDetailResponseDto addInsurance( InsuranceDetailRequestDto dto );

}
