package com.victorhugo.ecommercefitness.dto;

import com.victorhugo.ecommercefitness.enums.Employee.EmployeeGender;
import com.victorhugo.ecommercefitness.enums.Employee.EmployeeRole;

import java.util.Date;

public record RegisterAdminDTO(
        String name,
        EmployeeGender gender,
        Date birthDate,
        String cpf,
        String email,
        String phone,
        String password,
        EmployeeRole role) {
}
