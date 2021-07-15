package com.mercadolibre.projetofinal.dtos.response;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class AccountCreatedResponseDTO {
    private String id;
    private String username;
    private String warehouse;
    private String country;
}
