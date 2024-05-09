package com.riyality.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.riyality.Dto.DoctorSpecializationDto;
import com.riyality.Dto.doctors.DoctorPageDto;
import com.riyality.Dto.doctors.DoctorRequestDto;
import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.staff.StaffRequestDto;
import com.riyality.Dto.staff.StaffResponseDto;
import com.riyality.constants.MessageConstants;
import com.riyality.service.DropdownService;
import com.riyality.service.HrService;

@Controller
@RequestMapping( "/hrs" )
public class HrController {

	@Autowired
	private HrService hrService;

	@Autowired
	private DropdownService dropdownService;

	@GetMapping( "/addStaffForm" )
	public String addStaffForm( HttpSession session ) {

		return "staffs/add";

	}

	@GetMapping( "/addDoctorForm" )
	public String addDoctorForm( HttpSession session, Model model ) {
		List<DoctorSpecializationDto> specializations = dropdownService.allSpecializations();
		model.addAttribute( "specializations", specializations );
		return "doctors/add";

	}

	@PostMapping( "/doctors" )
	public String addDoctor( @ModelAttribute DoctorRequestDto doctorDto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			doctorDto.setBranch( branchId );
			String result = hrService.addDoctor( doctorDto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_DOCTOR_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_DOCTOR_SUCCESS_MESSAGE );
				return "redirect:/hrs/doctors";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_DOCTOR_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping( "/doctors" )
	public String allDoctors( Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );

		DoctorPageDto listofDoctors = hrService.allDoctors( branchId );

		if ( user != null ) {
			if ( listofDoctors != null ) {
				model.addAttribute( "list", listofDoctors );
				return "doctors/all";
			} else {
				model.addAttribute( "errorMsg", "something went wrong" );
				return "error";
			}
		}

		return "login";

	}

	@GetMapping( "/doctors/id" )
	public String selectDoctorById( @RequestParam long id, Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );

		DoctorResponseDto result = hrService.getDoctorById( id );

		if ( user != null ) {

			if ( result != null ) {
				List<DoctorSpecializationDto> specializations = dropdownService.allSpecializations();
				model.addAttribute( "specializations", specializations );
				model.addAttribute( "doctor", result );
				return "doctors/update";
			} else {
				model.addAttribute( "errorMsg", "Unable to update" );
				return "error";
			}
		}
		return "login";

	}

	@PostMapping( "/doctors/update" )
	public String updateDoctor( @ModelAttribute DoctorRequestDto doctorDto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			doctorDto.setBranch( branchId );
			String result = hrService.updateDoctor( doctorDto );

			if ( result.equalsIgnoreCase( MessageConstants.UPDATE_DOCTOR_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_DOCTOR_SUCCESS_MESSAGE );
				return "redirect:/hrs/doctors";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_DOCTOR_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@PostMapping( "/staffs" )
	public String addStaff( @ModelAttribute StaffRequestDto staffDto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			staffDto.setBranch( branchId );
			String result = hrService.addStaff( staffDto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_STAFF_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_STAFF_SUCCESS_MESSAGE );
				return "redirect:/hrs/staffs";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_STAFF_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping( "/staffs" )
	public String allStaffs( Model model, HttpSession session ) {

		Integer branchId = ( Integer ) session.getAttribute( "branchId" );

		List<StaffResponseDto> staffs = hrService.allStaffs( branchId );

		if ( staffs != null ) {
			model.addAttribute( "list", staffs );
			return "staffs/all";
		} else {
			model.addAttribute( "errorMsg", "something went wrong" );
			return "error";
		}

	}

	@PostMapping( "/staffs/update" )
	public String updateStaff( @ModelAttribute StaffRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranch( branchId );
			String result = hrService.updateStaff( dto );

			if ( result.equalsIgnoreCase( MessageConstants.UPDATE_STAFF_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_STAFF_SUCCESS_MESSAGE );
				return "redirect:/hrs/staffs";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_STAFF_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping( "/staffs/id" )
	public String selectStaffById( @RequestParam long id, Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );

		StaffResponseDto result = hrService.selectStaffById( id );

		if ( user != null ) {

			if ( result != null ) {
				model.addAttribute( "staff", result );
				return "doctors/update";
			} else {
				model.addAttribute( "errorMsg", "Unable to update" );
				return "error";
			}
		}
		return "login";

	}

}