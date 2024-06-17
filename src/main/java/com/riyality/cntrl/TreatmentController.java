package com.riyality.cntrl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.riyality.Dto.patients.TreatmentRequestDto;
import com.riyality.Dto.patients.TreatmentResponceDto;
import com.riyality.constants.MessageConstants;
import com.riyality.service.TreatmentServiceImpl;

@Controller
@RequestMapping("/treatment")
public class TreatmentController {

    @Autowired
    private TreatmentServiceImpl service;

    @PostMapping
    public String addTreatment(@RequestBody List<TreatmentRequestDto> dtos, Model model) {
        boolean allSuccessful = true;
        LocalDate currentDate = LocalDate.now();

        for (TreatmentRequestDto dto : dtos) {
            if (dto.getTreatment_date() == null) {
                dto.setTreatment_date(currentDate);
            }
        }

        String result = service.addTreatment(dtos);
        if (!MessageConstants.ADD_TREATMENT_SUCCESS_M.equalsIgnoreCase(result)) {
            allSuccessful = false;
        }

        if (allSuccessful) {
            return "admissions/treatments";
        } else {
            return "error";
        }
    }
    
    @GetMapping("/list/{admission}")
    public String getMethodName(@PathVariable Long admission,Model model) {
    	List<TreatmentResponceDto> result=service.treatmentList(admission);
    	System.out.println(result);
         model.addAttribute("listall", result);
         model.addAttribute("lists", admission);
    	return "admissions/add1";
    }
    
}
    	
    
    
