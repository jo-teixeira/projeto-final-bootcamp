package com.mercadolibre.projetofinal.unit.controller;

import com.mercadolibre.projetofinal.controller.AccountController;
import com.mercadolibre.projetofinal.dtos.response.AccountCreatedResponseDTO;
import com.mercadolibre.projetofinal.dtos.response.ProductResponseResponseDTO;
import com.mercadolibre.projetofinal.service.impl.AccountService;
import static com.mercadolibre.projetofinal.util.CreateTestEntities.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class AccountControllerTest {

    @Mock
    AccountService accountService;

    @InjectMocks
    AccountController accountController;

    @Test
    void getAllAccountsByCountry() {
        when(accountService.getUsersByCountry(any())).thenReturn(List.of(accountCreatedResponseDTO));

        ResponseEntity<List<AccountCreatedResponseDTO>> accountsDTOList = accountController.getUsersByCountry("brazil");

        assertEquals(HttpStatus.OK, accountsDTOList.getStatusCode());
    }

    @Test
    void shouldCreateAccount() {
        when(accountService.createAccount(any())).thenReturn(accountCreatedResponseDTO);

        ResponseEntity<AccountCreatedResponseDTO> accountCreatedDTOList = accountController.create(accountRequestDTO);

        assertEquals(HttpStatus.CREATED, accountCreatedDTOList.getStatusCode());
    }
}
