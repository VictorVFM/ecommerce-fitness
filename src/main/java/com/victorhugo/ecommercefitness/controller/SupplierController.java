package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.Supplier;
import com.victorhugo.ecommercefitness.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/suppliers")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    @PostMapping
    public ResponseEntity<Supplier> create(@RequestBody Supplier supplier) {
        Supplier createdSupplier = supplierService.create(supplier);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdSupplier);
    }

    @GetMapping
    public ResponseEntity<List<Supplier>> findAll() {
        List<Supplier> suppliers = supplierService.findAll();
        return ResponseEntity.ok(suppliers);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Supplier> findById(@PathVariable Long id) {
        Supplier supplier = supplierService.findById(id);
        return ResponseEntity.ok(supplier);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Supplier> update(@PathVariable Long id, @RequestBody Supplier supplier) {
        Supplier updatedSupplier = supplierService.update(id, supplier);
        return ResponseEntity.ok(updatedSupplier);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        supplierService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
