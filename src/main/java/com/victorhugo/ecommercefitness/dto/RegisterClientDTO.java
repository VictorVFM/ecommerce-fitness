package com.victorhugo.ecommercefitness.dto;

import com.victorhugo.ecommercefitness.model.ClientType;

public record RegisterClientDTO(
        String name,
        String email,
        String document,
        String phone,
        String password,
        ClientType type) {
}
