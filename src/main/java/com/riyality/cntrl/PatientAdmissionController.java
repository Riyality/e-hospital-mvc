 package com.riyality.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.dropdowns.MedicineTypeDto;
import com.riyality.Dto.patients.BillRequestDto;
import com.riyality.Dto.patients.DischargeResponseDto;
import com.riyality.Dto.patients.PatientAdmissionRequestDto;
import com.riyality.Dto.patients.PatientResponseDto;
import com.riyality.Dto.patients.TreatmentResponceDto;
import com.riyality.Dto.wards.WardResponseDto;
import com.riyality.constants.MessageConstants;
import com.riyality.service.DropdownService;
import com.riyality.service.HrService;
import com.riyality.service.PatientAdmissionService;
import com.riyality.service.PatientService;
import com.riyality.service.TreatmentServiceImpl;
import com.riyality.service.WardService;


@Controller
@RequestMapping( "/admissions" )
public class PatientAdmissionController {
	@Autowired
    private TreatmentServiceImpl service;

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
	public String addAdmission( @Valid @ModelAttribute PatientAdmissionRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranchId( branchId );
			String result = patientAdmissionService.addAdmission( dto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_ADMISSION_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_ADMISSION_SUCCESS_MESSAGE );
				return "redirect:/admissions/current-admissions";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_ADMISSION_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping( "/discharge-info/patient/{id}" )
	public String discharge( @PathVariable int id, Long id1,Model model ) {
		DischargeResponseDto dto = patientAdmissionService.dischargePatient( id );
		model.addAttribute( "data", dto );
		List<TreatmentResponceDto> result=service.treatmentList((long) id);
    	System.out.println(result);
         model.addAttribute("listall", result);
         model.addAttribute("lists", id);
		return "admissions/discharge";
	}

	@GetMapping( "/treatments/admissions/{id}" )
	public String discharge( @PathVariable Long id, Model model ) {
		System.out.println(id);
		List<TreatmentResponceDto> result=service.treatmentList(id);
    	System.out.println(result);
         model.addAttribute("listall", result);
         model.addAttribute("lists", id);
		List<MedicineTypeDto> medicineTypes = dropdownService.allMedicineTypes();
		model.addAttribute( "medicineTypes", medicineTypes );
		model.addAttribute("admission_id", id);
		return "admissions/treatments";
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

	

	@ResponseBody
    @PostMapping("/discharge/patient/{id}")
    public String dischargePatient(@PathVariable int id) {
        try {
            patientAdmissionService.updateStatus(id);
         
            return "Patient discharged successfully";
        } catch (Exception e) {
            return "Error discharging patient: " + e.getMessage();
        }
    }

	@ResponseBody
	@GetMapping( "/admission-history/patient/{id}" )
	public List<PatientAdmissionResponseDto> getAdmissionDetailsByPatient( @PathVariable Long id, Model model ) {

		List<PatientAdmissionResponseDto> result = patientService.getAdmissionDetailsByPatient( id );
		//model.addAttribute( "AdmissionList", result );
		return result;
	}
	


}
