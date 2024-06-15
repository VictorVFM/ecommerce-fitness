package com.victorhugo.ecommercefitness.controller;

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

    @GetMapping("/{id}")
    public ResponseEntity<Order> findById(@PathVariable Long id){
        Order order = orderService.findById(id);
        return ResponseEntity.ok(order);
    }

    @GetMapping("/client/{email}")
    public ResponseEntity<List<Order>> findByClient(@PathVariable String email){
        List<Order> order = orderService.findByClient(email);
        return ResponseEntity.ok(order);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Order> update(@PathVariable Long id, @RequestBody Order order){
        Order updatedOrder = orderService.update(id, order);
        return ResponseEntity.ok(updatedOrder);
    }

}
