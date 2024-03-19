package com.nt.service;

import com.nt.Dto.insurance.InsuranceDetailRequestDto;
import com.nt.Dto.insurance.InsuranceDetailResponseDto;

public interface InsuranceDetailService {

	InsuranceDetailResponseDto findPolicy( String policyNumber );

	InsuranceDetailResponseDto addInsurance( InsuranceDetailRequestDto dto );

}
