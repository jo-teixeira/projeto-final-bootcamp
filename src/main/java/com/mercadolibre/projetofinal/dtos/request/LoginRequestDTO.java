package com.mercadolibre.projetofinal.dtos.request;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginRequestDTO {
    private String username;
    private String password;
}