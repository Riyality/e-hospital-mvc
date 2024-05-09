package com.riyality.service;

import java.util.List;

import com.riyality.Dto.doctors.DoctorPageDto;
import com.riyality.Dto.doctors.DoctorRequestDto;
import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.staff.StaffRequestDto;
import com.riyality.Dto.staff.StaffResponseDto;

public interface HrService {

	String addDoctor( DoctorRequestDto doctorDto );

	DoctorPageDto allDoctors( Integer branchId );

	DoctorResponseDto getDoctorById( long id );

	String updateDoctor( DoctorRequestDto doctorDto );

	public List<DoctorResponseDto> allDoctorsList( Integer branchId );

	String addStaff( StaffRequestDto staffDto );

	List<StaffResponseDto> allStaffs( Integer branchId );

	String updateStaff( StaffRequestDto dto );

	StaffResponseDto selectStaffById( long id );

}
