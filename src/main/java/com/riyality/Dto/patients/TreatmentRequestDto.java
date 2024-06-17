package com.riyality.Dto.patients;

import java.time.LocalDate;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TreatmentRequestDto {
    private String medicine_type;
    private String medicine;
    private int quantity;
    private int price;
   
    private LocalDate treatment_date;
    private String payment;
    private Long admission;
    
    @Override
    public String toString() {
        return "TreatmentRequestDto{" +
                "medicineType='" + medicine_type + '\'' +
                ", medicine='" + medicine + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", treatmentDate=" + treatment_date +
                ", payment='" + payment + '\'' +
                ", admission=" + admission +
                '}';
    }

}


