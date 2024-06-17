package com.riyality.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.riyality.Dto.patients.PatientAdmissionResponseDto;
import com.riyality.Dto.patients.PatientContent;
import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientResponseDto;
import com.riyality.service.ReportService;

@Controller

public class Reports {
	@Autowired
	 ReportService reportService;
	
	@RequestMapping( "/showPatients" )
	public String showPatientsForm(){
		return "Reports/showAdmitPatientsForm";
	}
	@GetMapping( "/submitShowPatientsForm" )
	public String submitShowPatientsForm (@RequestParam String type ,Model model, HttpSession session){
		
		String user = ( String ) session.getAttribute( "username" );
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );
		List<PatientAdmissionResponseDto> patientsRecord=reportService.submitShowPatientsForm(type, user);
		model.addAttribute( "patientsRecord1", patientsRecord );
		
		return "Reports/showAdmitPatients";
	}
	

}
 