package com.riyality.Dto.patients;

import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;

import com.riyality.Dto.Pageable;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PatientPageDto {
	public List<PatientContent> content;
	public Pageable pageable;
	public boolean last;
	public int totalPages;
	public int totalElements;
	public int number;
	public int size;
	public Sort sort;
	public boolean first;
	public int numberOfElements;
	public boolean empty;
}
