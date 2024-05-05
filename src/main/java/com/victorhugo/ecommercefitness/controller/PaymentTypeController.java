package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.model.PaymentType;
import com.victorhugo.ecommercefitness.service.PaymentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/payment-types")
public class PaymentTypeController {

    @Autowired
    private PaymentTypeService paymentTypeService;

    @GetMapping
    public ResponseEntity<List<PaymentType>> findAll() {
        List<PaymentType> paymentTypes = paymentTypeService.findAll();
        return ResponseEntity.ok(paymentTypes);
    }

    @GetMapping("/{id}")
    public ResponseEntity<PaymentType> findById(@PathVariable Long id) {
        PaymentType paymentType = paymentTypeService.findById(id);
        return ResponseEntity.ok().body(paymentType);
    }

    @PostMapping
    public ResponseEntity<PaymentType> create(@RequestBody PaymentType paymentType) {
        paymentType = paymentTypeService.create(paymentType);
        return ResponseEntity.status(HttpStatus.CREATED).body(paymentType);
    }

    @PutMapping("/{id}")
    public ResponseEntity<PaymentType> update(@PathVariable Long id, @RequestBody PaymentType paymentType) {
        paymentTypeService.update(id,paymentType);
        return ResponseEntity.ok().body(paymentType);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        paymentTypeService.delete(id);
        return ResponseEntity.noContent().build();
    }
}