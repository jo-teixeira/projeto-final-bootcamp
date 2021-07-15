package com.mercadolibre.projetofinal.controller;

import com.mercadolibre.projetofinal.dtos.request.AccountRequestDTO;
import com.mercadolibre.projetofinal.dtos.response.AccountCreatedResponseDTO;
import com.mercadolibre.projetofinal.service.IAccountService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RequestMapping(path = "/api/v1/admin/user")
@RestController
@AllArgsConstructor
public class AccountController {
    private final IAccountService adminService;


    @PostMapping
    public ResponseEntity<AccountCreatedResponseDTO> create(@RequestBody @Valid AccountRequestDTO accountRequestDTO) {
        return ResponseEntity.status(HttpStatus.CREATED).body(adminService.createAccount(accountRequestDTO));
    }

    @GetMapping
    public ResponseEntity<List<AccountCreatedResponseDTO>> getUsersByCountry(@RequestParam String country) {
        return ResponseEntity.status(HttpStatus.OK).body(adminService.getUsersByCountry(country));
    }

}
