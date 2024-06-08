package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.OrderItem;
import com.victorhugo.ecommercefitness.repositories.OrderItemsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderItemService {

    @Autowired
    private OrderItemsRepository orderItemsRepository;

    public OrderItem create(OrderItem orderItem) {
        return orderItemsRepository.save(orderItem);
    }


}
