package com.nt.service;

import java.util.List;

import com.nt.Dto.DoctorSpecializationDto;
import com.nt.Dto.DoctorSpecializationDtoWrapper;
import com.nt.Dto.dropdowns.MedicineTypeDto;

public interface DropdownService {

	List<DoctorSpecializationDto> allSpecializations();

	String addSpecialization( DoctorSpecializationDtoWrapper dto );

	List<MedicineTypeDto> allMedicineTypes();

}
