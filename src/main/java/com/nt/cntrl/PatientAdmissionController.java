package com.nt.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Dto.doctors.DoctorResponseDto;
import com.nt.Dto.dropdowns.MedicineTypeDto;
import com.nt.Dto.patients.BillRequestDto;
import com.nt.Dto.patients.DischargeResponseDto;
import com.nt.Dto.patients.PatientAdmissionRequestDto;
import com.nt.Dto.patients.PatientResponseDto;
import com.nt.Dto.wards.WardResponseDto;
import com.nt.constants.MessageConstants;
import com.nt.service.DropdownService;
import com.nt.service.HrService;
import com.nt.service.PatientAdmissionService;
import com.nt.service.PatientService;
import com.nt.service.WardService;

@Controller
@RequestMapping( "/admissions" )
public class PatientAdmissionController {

	@Autowired
	private PatientService patientService;

	@Autowired
	private HrService hrService;

	@Autowired
	private WardService wardService;

	@Autowired
	private PatientAdmissionService patientAdmissionService;

	@Autowired
	private DropdownService dropdownService;

	@GetMapping( "/addAdmissionForm" )
	public String addAdmissionForm( HttpSession session, Model model ) {
		return "admissions/add";

	}

	@GetMapping( "/patient/{id}" )
	public String bookAppointmentsForm( Model model, HttpSession session, @PathVariable long id ) {
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );
		List<DoctorResponseDto> doctors = hrService.allDoctorsList( branchId );
		model.addAttribute( "doctors", doctors );

		PatientResponseDto patient = patientService.getPatientById( id );
		model.addAttribute( "patient", patient );

		List<WardResponseDto> wards = wardService.findAvailableWards( branchId );
		model.addAttribute( "wards", wards );

		return "admissions/add";
	}

	@PostMapping
	public String addAdmission( @ModelAttribute PatientAdmissionRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranchId( branchId );
			String result = patientAdmissionService.addAdmission( dto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_ADMISSION_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_ADMISSION_SUCCESS_MESSAGE );
				return "redirect:/wards";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_ADMISSION_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping( "/discharge-info/patient/{id}" )
	public String discharge( @PathVariable int id, Model model ) {
		DischargeResponseDto dto = patientAdmissionService.dischargePatient( id );
		model.addAttribute( "data", dto );
		return "admissions/discharge";
	}

	@GetMapping( "/treatments/admissions/{id}" )
	public String discharge( @PathVariable Long id, Model model ) {
		List<MedicineTypeDto> medicineTypes = dropdownService.allMedicineTypes();
		model.addAttribute( "medicineTypes", medicineTypes );
		return "admissions/treatment";
	}

	@GetMapping( "/current-admissions" )
	public String currentAdmissions( Model model, HttpSession session ) {
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );
		List<PatientResponseDto> patients = patientAdmissionService.findAllCurrentAdmissions( branchId );
		model.addAttribute( "list", patients );
		return "admissions/currentAdmissions";

	}

	@ResponseBody
	@PostMapping( "/bills/admissions" )
	public String generateAndPayBill( @RequestBody BillRequestDto dto ) {
		return patientAdmissionService.generateAndPayBill( dto );
	}

	@GetMapping( "/details-form/{id}" )
	public String getPatientDetailsForm( @PathVariable Long id, Model model ) {

		PatientResponseDto result = patientService.getPatientById( id );
		model.addAttribute( "patientList", result );
		return "admissions/details";
	}

}
