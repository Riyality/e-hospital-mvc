package com.nt.service;

import java.util.List;

import com.nt.Dto.BranchDto;
import com.nt.Dto.BranchResponceDto;

public interface BranchService {

	public BranchDto getById( int id );

	public String add( BranchDto branchDto );

	public List<BranchResponceDto> allBranch();
}
