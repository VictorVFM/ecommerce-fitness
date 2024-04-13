package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.Address;
import com.victorhugo.ecommercefitness.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/addresses")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @PostMapping("/{clientId}")
    public ResponseEntity<Address> create(@PathVariable Long clientId, @RequestBody Address address) {
        Address createdAddress = addressService.create(clientId, address);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdAddress);
    }

    @GetMapping
    public ResponseEntity<List<Address>> findAll() {
        List<Address> addresses = addressService.findAll();
        return ResponseEntity.ok(addresses);
    }

    @GetMapping("/{id}")
    public ResponseEntity<List<Address>> findById(@PathVariable Long id) {
        List<Address> address = addressService.findByClient(id);
        return ResponseEntity.ok().body(address);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        addressService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
