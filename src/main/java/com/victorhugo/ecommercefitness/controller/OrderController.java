package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.dto.OrderDTO;
import com.victorhugo.ecommercefitness.model.Food;
import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.model.Order;
import com.victorhugo.ecommercefitness.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping
    public ResponseEntity<Order> create(@RequestBody Order order){


        Order createdOrder = orderService.create(order);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdOrder);
    }

    @GetMapping
    public ResponseEntity<List<Order>> findAll(){
        List<Order> orders = orderService.findAll();
        return ResponseEntity.ok(orders);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Order> update(@PathVariable Long id, @RequestBody Order order){
        Order updatedOrder = orderService.update(id, order);
        return ResponseEntity.ok(updatedOrder);
    }

}
