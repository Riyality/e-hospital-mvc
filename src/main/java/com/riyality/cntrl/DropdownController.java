package com.riyality.cntrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.riyality.service.DropdownService;
import com.riyality.Dto.DoctorSpecializationDto;
import com.riyality.Dto.DoctorSpecializationDtoWrapper;

@Controller
@RequestMapping( "/drop-downs" )
public class DropdownController {

	@Autowired
	private DropdownService dropdownService;

	@ResponseBody
	@GetMapping( "/specializations" )
	public List<DoctorSpecializationDto> allSpecializations() {
		return dropdownService.allSpecializations();

	}

	@ResponseBody
	@PostMapping( "/specializations" )
	public String addSpecialization( @RequestBody DoctorSpecializationDtoWrapper dto ) {
		return dropdownService.addSpecialization( dto );
	}

	@GetMapping( "/specializations/form" )
	public String addSpecializations() {
		return "dropdowns/addSpecializations";
	}
}
