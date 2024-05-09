package com.riyality.cntrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping( "/" )
	public String index() {
		return "index";
	}
	
	
	@GetMapping( "/addbranch" )
	public String branch() {
		return "branch";
	}


}
