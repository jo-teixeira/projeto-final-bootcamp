package com.mercadolibre.projetofinal.dtos.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PurchaseValueResponseDTO {
    private String id;
    private Double totalPrice;
}
