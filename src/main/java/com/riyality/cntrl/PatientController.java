package com.riyality.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.patients.PatientPageDto;
import com.riyality.Dto.patients.PatientRequestDto;
import com.riyality.Dto.patients.PatientResponseDto;
import com.riyality.constants.MessageConstants;
import com.riyality.service.HrService;
import com.riyality.service.PatientService;

@Controller
@RequestMapping( "/patients" )
public class PatientController {

	@Autowired
	private PatientService patientService;

	@Autowired
	private HrService hrService;

	@RequestMapping( "/add-form" )
	public String addPatientForm( HttpSession session, Model model ) {
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );
		List<DoctorResponseDto> doctors = hrService.allDoctorsList( branchId );
		model.addAttribute( "doctors", doctors );
		return "patients/add";
	}

	@PostMapping
	public String addPatient( @ModelAttribute PatientRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranch( branchId );
			String result = patientService.addPatient( dto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_PATIENT_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_PATIENT_SUCCESS_MESSAGE );
				return "redirect:/patients";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_PATIENT_ERROR_MSG );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping
	public String allPatients( Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );

		PatientPageDto listofDoctors = patientService.allPatients( branchId );

		if ( user != null ) {
			if ( listofDoctors != null ) {
				model.addAttribute( "list", listofDoctors );
				return "patients/all";
			} else {
				model.addAttribute( "errorMsg", "something went wrong" );
				return "error";
			}
		}

		return "login";

	}

	@GetMapping( "/id" )
	public String selectPatientById( @RequestParam long id, Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );

		PatientResponseDto result = patientService.getPatientById( id );

		if ( user != null ) {

			if ( result != null ) {
				model.addAttribute( "patient", result );
				Integer branchId = ( Integer ) session.getAttribute( "branchId" );
				List<DoctorResponseDto> doctors = hrService.allDoctorsList( branchId );
				model.addAttribute( "doctors", doctors );
				return "patients/update";
			} else {
				model.addAttribute( "errorMsg", "Unable to update" );
				return "error";
			}
		}
		return "login";

	}

	@PostMapping( "/update" )
	public String updatePatient( @ModelAttribute PatientRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranch( branchId );
			String result = patientService.updatePatient( dto );

			if ( result.equalsIgnoreCase( MessageConstants.UPDATE_PATIENT_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_PATIENT_SUCCESS_MESSAGE );
				return "redirect:/patients";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_PATIENT_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}
	
	@GetMapping("/details-form/{id}")
	public String getPatientDetailsForm(@PathVariable Long id, Model model) {
		
		PatientResponseDto result = patientService.getPatientById( id );
		model.addAttribute( "patientList", result );
		return "patients/details";
	}
}
