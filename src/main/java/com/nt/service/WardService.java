package com.nt.service;

import java.util.List;

import com.nt.Dto.wards.WardRequestDto;
import com.nt.Dto.wards.WardResponseDto;

public interface WardService {

	String addWard( WardRequestDto dto );

	List<WardResponseDto> allWards( Integer branchId );

	WardResponseDto getWardById( long id );

	String updateWard( WardRequestDto dto );

	List<WardResponseDto> findAvailableWards( Integer branchId );

}
