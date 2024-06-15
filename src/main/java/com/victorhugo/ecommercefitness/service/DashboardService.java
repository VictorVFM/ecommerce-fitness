package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DashboardService {

    @Autowired
    OrderRepository orderRepository;

    public List<Long> countOrdersByMonthInCurrentYear(){
        return orderRepository.countOrdersByMonthInCurrentYear();
    }
}
