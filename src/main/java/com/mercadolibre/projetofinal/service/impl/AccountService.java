package com.mercadolibre.projetofinal.service.impl;

import com.mercadolibre.projetofinal.dtos.request.AccountRequestDTO;
import com.mercadolibre.projetofinal.dtos.response.AccountCreatedResponseDTO;
import com.mercadolibre.projetofinal.enums.AccountRolesEnum;
import com.mercadolibre.projetofinal.enums.CountryEnum;
import com.mercadolibre.projetofinal.exceptions.ApiException;
import com.mercadolibre.projetofinal.model.Account;
import com.mercadolibre.projetofinal.repository.AccountRepository;
import com.mercadolibre.projetofinal.service.IAccountService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.EnumUtils;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.mercadolibre.projetofinal.enums.ErrorsEnum.ML802;
import static com.mercadolibre.projetofinal.enums.ErrorsEnum.ML803;
import static com.mercadolibre.projetofinal.enums.ErrorsEnum.ML804;
import static com.mercadolibre.projetofinal.enums.ErrorsEnum.ML805;

@Service
@AllArgsConstructor
public class AccountService implements IAccountService {
    private final AccountRepository accountRepository;
    private final WarehouseService warehouseService;


    @Override
    public AccountCreatedResponseDTO createAccount(AccountRequestDTO accountRequestDTO) {
        accountRequestValidation(accountRequestDTO);

        accountRequestDTO.setPassword(BCrypt.hashpw(accountRequestDTO.getPassword(), BCrypt.gensalt(10)));

        Account account = accountRepository.save(new Account(accountRequestDTO,
                warehouseService.findById(accountRequestDTO.getWarehouseId())));

        return new AccountCreatedResponseDTO( account.getId(), account.getUsername(), account.getWarehouse().getId(),
                                              account.getCountry().getName());
    }

    @Override
    public List<AccountCreatedResponseDTO> getUsersByCountry(String country) {
        List<Account> account = accountRepository.findAllByCountry(CountryEnum.valueOf(country.toUpperCase()));
        return account.stream().map(this::toModel).collect(Collectors.toList());
    }

    private AccountCreatedResponseDTO toModel(Account account){
        return new AccountCreatedResponseDTO(account.getId(), account.getUsername(), account.getWarehouse().getId(),
                                             account.getCountry().getName());
    }

    private void accountRequestValidation(AccountRequestDTO accountRequestDTO){
        if(accountRepository.findByUsername(accountRequestDTO.getUsername()).isPresent()){
            throw new ApiException(ML802);
        }else if(!EnumUtils.isValidEnum(AccountRolesEnum.class, accountRequestDTO.getRole())){
            throw new ApiException(ML803);
        }else if(!EnumUtils.isValidEnum(CountryEnum.class, accountRequestDTO.getCountry())){
            throw new ApiException(ML804);
        }else if(!warehouseService.findWarehouseById(accountRequestDTO.getWarehouseId())
                .getCountry().getName().equals(accountRequestDTO.getCountry())){
            throw new ApiException(ML805);
        }
    }
}
