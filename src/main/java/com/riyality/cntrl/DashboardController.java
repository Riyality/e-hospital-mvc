package com.riyality.cntrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/dashboards" )
public class DashboardController {

	@RequestMapping( "/hr" )
	public String hrDashboard() {
		return "dashboard/hrDashboard";
	}
}
