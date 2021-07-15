package com.mercadolibre.projetofinal.service;

import com.mercadolibre.projetofinal.dtos.AccountDTO;
import com.mercadolibre.projetofinal.dtos.request.AccountRequestDTO;
import com.mercadolibre.projetofinal.dtos.response.AccountCreatedResponseDTO;

import java.util.List;

public interface IAccountService {
    AccountCreatedResponseDTO createAccount(AccountRequestDTO accountRequestDTO);
    List<AccountCreatedResponseDTO> getUsersByCountry(String country);
}
