package com.riyality.service;

import java.util.List;

import com.riyality.Dto.BranchDto;
import com.riyality.Dto.BranchResponceDto;

public interface BranchService {

	public BranchDto getById( int id );

	public String add( BranchDto branchDto );

	public List<BranchResponceDto> allBranch();
}
