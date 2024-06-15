package com.victorhugo.ecommercefitness.controller;


import com.victorhugo.ecommercefitness.model.Order;
import com.victorhugo.ecommercefitness.service.DashboardService;
import com.victorhugo.ecommercefitness.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping
    public ResponseEntity<List<Long>> findAll(){
        List<Long> orders = dashboardService.countOrdersByMonthInCurrentYear();
        return ResponseEntity.ok(orders);
    }
}
