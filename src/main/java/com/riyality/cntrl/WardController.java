package com.riyality.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.riyality.constants.MessageConstants;
import com.riyality.service.WardService;
import com.riyality.Dto.wards.WardRequestDto;
import com.riyality.Dto.wards.WardResponseDto;

@Controller
@RequestMapping( "/wards" )
public class WardController {

	@Autowired
	private WardService wardService;

	@GetMapping( "/addWardForm" )
	public String addWardForm( HttpSession session, Model model ) {
		return "wards/add";

	}

	@PostMapping
	public String addWard( @Valid @ModelAttribute WardRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranch( branchId );
			String result = wardService.addWard( dto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_WARD_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_WARD_SUCCESS_MESSAGE );
				return "redirect:/wards";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_WARD_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@GetMapping
	public String allWards(@Valid Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );

		List<WardResponseDto> wards = wardService.allWards( branchId );

		if ( user != null ) {
			if ( wards != null ) {
				model.addAttribute( "list", wards );
				return "wards/all";
			} else {
				model.addAttribute( "errorMsg", "something went wrong" );
				return "error";
			}
		}

		return "login";

	}

	@GetMapping( "/id" )
	public String selectWardById( @RequestParam long id, Model model, HttpSession session ) {

		String user = ( String ) session.getAttribute( "username" );

		WardResponseDto result = wardService.getWardById( id );

		if ( user != null ) {

			if ( result != null ) {
				model.addAttribute( "ward", result );
				return "wards/update";
			} else {
				model.addAttribute( "errorMsg", "Unable to update" );
				return "error";
			}
		}
		return "login";

	}

	@PostMapping( "/update" )
	public String updateWard( @Valid @ModelAttribute WardRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			Integer branchId = ( Integer ) session.getAttribute( "branchId" );
			dto.setBranch( branchId );
			String result = wardService.updateWard( dto );

			if ( result.equalsIgnoreCase( MessageConstants.UPDATE_WARD_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.UPDATE_WARD_SUCCESS_MESSAGE );
				return "redirect:/wards";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.UPDATE_WARD_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}
}
