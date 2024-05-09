package com.riyality.service;

import java.util.List;

import com.riyality.Dto.wards.WardRequestDto;
import com.riyality.Dto.wards.WardResponseDto;

public interface WardService {

	String addWard( WardRequestDto dto );

	List<WardResponseDto> allWards( Integer branchId );

	WardResponseDto getWardById( long id );

	String updateWard( WardRequestDto dto );

	List<WardResponseDto> findAvailableWards( Integer branchId );

}
