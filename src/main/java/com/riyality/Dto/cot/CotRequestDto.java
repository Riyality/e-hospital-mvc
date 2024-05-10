package com.riyality.Dto.cot;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CotRequestDto {
	private Long id;
	@NotNull
	private int cotNumber;
	@NotNull
	private Long wardId;
	private String status;

}