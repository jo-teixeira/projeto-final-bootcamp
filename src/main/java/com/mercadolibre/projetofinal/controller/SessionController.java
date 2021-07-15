package com.mercadolibre.projetofinal.controller;

import com.mercadolibre.projetofinal.dtos.request.LoginRequestDTO;
import com.mercadolibre.projetofinal.dtos.response.AccountResponseDTO;
import javassist.NotFoundException;
import com.mercadolibre.projetofinal.service.ISessionService;
import org.springframework.web.bind.annotation.*;

@RequestMapping(path = "/api/v1")
@RestController
public class SessionController {
    private final ISessionService service;

    public SessionController(ISessionService sessionService) {
        this.service = sessionService;
    }

    @PostMapping("/sign-in")
    public AccountResponseDTO login(@RequestBody LoginRequestDTO loginRequestDTO) throws NotFoundException {
        return service.login(loginRequestDTO.getUsername(), loginRequestDTO.getPassword());
    }

}
