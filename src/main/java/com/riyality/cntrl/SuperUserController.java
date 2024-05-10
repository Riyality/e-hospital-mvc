package com.riyality.cntrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.riyality.service.BranchService;
import com.riyality.Dto.BranchDto;
import com.riyality.Dto.BranchResponceDto;

@Controller
@RequestMapping( "/superuser" )
public class SuperUserController {

	@Autowired
	private BranchService branchService;

	@GetMapping( "/addBranch" )
	public String addbranch() {
		return "branchs/addBranch";
	}

	@PostMapping( "/branch" )
	public String add( @ModelAttribute BranchDto branchDto, Model model ) {
		String result = branchService.add( branchDto );
		if ( result.equalsIgnoreCase( "Branch Added Success" ) ) {
			model.addAttribute( "msg", "Branch Added successfully" );
			return "redirect:/superuser/branchs";
		} else {
			model.addAttribute( "errorMsg", "unabel to Add Branch" );
			return "error";
		}
	}

	@GetMapping( "/branchs" )
	public String allBranch( Model model ) {
		List<BranchResponceDto> listBranch = branchService.allBranch();
		if ( listBranch != null ) {
			model.addAttribute( "list", listBranch );
			return "branchs/allBranch";
		}
		return null;
	}

}
