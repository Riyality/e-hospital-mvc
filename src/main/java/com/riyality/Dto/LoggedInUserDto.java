package com.riyality.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoggedInUserDto {
	private int id;
	private String name;
	private String username;
	private String role;
	private String status;
}
