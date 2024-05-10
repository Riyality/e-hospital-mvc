package com.riyality.Dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class LoginRequestDto {
	private int id;
	@NotNull
    @Size(max = 32)
	private String username;
	@NotNull
    @Size(max = 32)
	private String password;
	
	private String role;

}
