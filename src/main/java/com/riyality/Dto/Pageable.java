package com.riyality.Dto;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Pageable {

	public Sort sort;
	public int offset;
	public int pageSize;
	public int pageNumber;
	public boolean paged;
	public boolean unpaged;
}
