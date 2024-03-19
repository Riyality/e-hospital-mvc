package com.nt.service;

import java.util.List;

import javax.validation.Valid;

import com.nt.Dto.cot.CotRequestDto;
import com.nt.Dto.cot.CotResponseDto;

public interface CotService {

	String addCot( @Valid CotRequestDto dto );

	List<CotResponseDto> availableCots( Long id );

	List<CotResponseDto> allCots( Long id );

}
