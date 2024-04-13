package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Supplier;
import com.victorhugo.ecommercefitness.repositories.SupplierRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    public List<Supplier> findAll() {
        return supplierRepository.findByStatusTrue();
    }

    public Supplier findById(Long id) {
        Optional<Supplier> obj = supplierRepository.findById(id);
        return obj.orElseThrow(() -> new RuntimeException("Supplier not found"));
    }

    public Supplier create(Supplier supplier) {
        return supplierRepository.save(supplier);
    }

    public void delete(Long id) {
        supplierRepository.delete(id);
    }

    public Supplier update(Long id, Supplier supplier) {
        try {
            Supplier entity = supplierRepository.getOne(id);
            updateData(entity, supplier);
            return supplierRepository.save(entity);
        } catch (EntityNotFoundException e) {
            throw new RuntimeException("Supplier not found with ID: " + id);
        }
    }

    public void updateData(Supplier entity, Supplier newEntity) {
        entity.setBusinessName(newEntity.getBusinessName());
        entity.setCnpj(newEntity.getCnpj());
        entity.setEmail(newEntity.getEmail());
        entity.setPhone(newEntity.getPhone());
        entity.setStatus(newEntity.getStatus());
    }
}
