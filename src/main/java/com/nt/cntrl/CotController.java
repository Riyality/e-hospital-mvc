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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Dto.cot.CotRequestDto;
import com.nt.Dto.cot.CotResponseDto;
import com.nt.Dto.wards.WardResponseDto;
import com.nt.constants.MessageConstants;
import com.nt.service.CotService;
import com.nt.service.WardService;

@Controller
@RequestMapping( "/cots" )
public class CotController {

	@Autowired
	private CotService cotService;

	@Autowired
	private WardService wardService;

	@GetMapping( "/addCotForm" )
	public String addCotsForm( HttpSession session, Model model ) {
		Integer branchId = ( Integer ) session.getAttribute( "branchId" );
		List<WardResponseDto> availableWards = wardService.findAvailableWards( branchId );
		model.addAttribute( "wards", availableWards );
		return "cots/add";

	}

	@PostMapping
	public String addWard( @ModelAttribute CotRequestDto dto, Model model, HttpSession session, RedirectAttributes ra ) {

		String user = ( String ) session.getAttribute( "username" );

		if ( user != null ) {
			String result = cotService.addCot( dto );

			if ( result.equalsIgnoreCase( MessageConstants.ADD_COT_SUCCESS_MESSAGE ) ) {
				ra.addFlashAttribute( "successMessage", MessageConstants.ADD_COT_SUCCESS_MESSAGE );
				return "redirect:/hrs/doctors";
			} else {
				ra.addFlashAttribute( "errorMessage", MessageConstants.ADD_COT_ERROR_MESSAGE );
				return "error";
			}

		}
		return "login";
	}

	@ResponseBody
	@GetMapping( "/available/wards/{id}" )
	public List<CotResponseDto> availableCots( Model model, HttpSession session, @PathVariable Long id ) {
		return cotService.availableCots( id );

	}

	@ResponseBody
	@GetMapping( "/wards/{id}" )
	public List<CotResponseDto> allCots( Model model, HttpSession session, @PathVariable Long id ) {
		return cotService.allCots( id );

	}

}
