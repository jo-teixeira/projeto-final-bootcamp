package com.mercadolibre.projetofinal.unit.service;

import static com.mercadolibre.projetofinal.util.CreateTestEntities.*;

import com.mercadolibre.projetofinal.dtos.response.AccountCreatedResponseDTO;
import com.mercadolibre.projetofinal.exceptions.ApiException;
import com.mercadolibre.projetofinal.repository.AccountRepository;
import com.mercadolibre.projetofinal.service.impl.AccountService;
import com.mercadolibre.projetofinal.service.impl.WarehouseService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class AccountServiceTest {

    @Mock
    AccountRepository accountRepository;

    @Mock
    WarehouseService warehouseService;

    @InjectMocks
    AccountService accountService;

    @Test
    void shouldThrowApiExceptionWhenUsernameExists() {
        when(accountRepository.findByUsername(any())).thenReturn(Optional.empty());
        when(warehouseService.findWarehouseById(any())).thenReturn(warehouse);

        assertThrows(ApiException.class, () -> accountService.createAccount(accountRequestDTO),
                "User country and warehouse country must be equals");
    }

    @Test
    void shouldGetCorrectListSizeOfAccountsByCountry() {
        when(accountRepository.findAllByCountry(any())).thenReturn(List.of(account));

        List<AccountCreatedResponseDTO> accountCreatedResponseDTOS = accountService.getUsersByCountry("brazil");

        assertEquals(1, accountCreatedResponseDTOS.size());
    }
}
