package com.victorhugo.ecommercefitness.dto;

import com.victorhugo.ecommercefitness.model.Food;
import com.victorhugo.ecommercefitness.model.OrderItem;

import java.util.List;

public record OrderDTO(
        Long id_Client,
        Long id_Employee,
        Long id_PaymentType,
        String address,
        List<OrderItem> orderItems
) {
}
