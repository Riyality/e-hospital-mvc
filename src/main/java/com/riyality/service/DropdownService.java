package com.riyality.service;

import java.util.List;

import com.riyality.Dto.DoctorSpecializationDto;
import com.riyality.Dto.DoctorSpecializationDtoWrapper;
import com.riyality.Dto.dropdowns.MedicineTypeDto;

public interface DropdownService {

	List<DoctorSpecializationDto> allSpecializations();

	String addSpecialization( DoctorSpecializationDtoWrapper dto );

	List<MedicineTypeDto> allMedicineTypes();

}
