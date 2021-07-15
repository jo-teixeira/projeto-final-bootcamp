package com.mercadolibre.projetofinal.dtos.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AccountRequestDTO {
    @NotNull
    @NotBlank
    @Size(min=8,max = 50, message = "username must be between 8 and 50 characters")
    private String username;
    @NotNull
    @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$",
            message = "password must have special, lower and upper characters and must be between 8 and 50 characters")
    private String password;
    @NotNull
    private String country;
    @NotNull
    private String role;
    @NotNull
    private String warehouseId;
}
