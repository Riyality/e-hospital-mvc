package com.riyality.cntrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.riyality.Dto.insurance.InsuranceDetailRequestDto;
import com.riyality.Dto.insurance.InsuranceDetailResponseDto;
import com.riyality.service.InsuranceDetailService;

@Controller
@RequestMapping( "/insurance-details" )
public class InsuranceDetailController {

	@Autowired
	private InsuranceDetailService insuranceService;

	@ResponseBody
	@RequestMapping( "/policy-number/{policyNumber}" )
	public InsuranceDetailResponseDto findPolicy( @PathVariable String policyNumber ) {
		InsuranceDetailResponseDto dto = insuranceService.findPolicy( policyNumber );
		return dto;
	}

	@ResponseBody
	@PostMapping
	public InsuranceDetailResponseDto addInsurance( @RequestBody InsuranceDetailRequestDto dto, Model model, HttpSession session ) {

		InsuranceDetailResponseDto result = insuranceService.addInsurance( dto );

		return result;
	}
}
