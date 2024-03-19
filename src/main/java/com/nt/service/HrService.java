package com.nt.service;

import java.util.List;

import com.nt.Dto.doctors.DoctorPageDto;
import com.nt.Dto.doctors.DoctorRequestDto;
import com.nt.Dto.doctors.DoctorResponseDto;
import com.nt.Dto.staff.StaffRequestDto;
import com.nt.Dto.staff.StaffResponseDto;

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
