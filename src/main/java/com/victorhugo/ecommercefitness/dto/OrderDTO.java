package com.victorhugo.ecommercefitness.dto;

public record OrderDTO(
        Long id_Client,
        Long id_Employee,
        Long id_PaymentType,
        String address
) {
}
