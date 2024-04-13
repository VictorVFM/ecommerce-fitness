package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.model.Supplier;
import com.victorhugo.ecommercefitness.repositories.SupplierRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
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
        return obj.orElseThrow(() -> new ResourceNotFoundException(id,"Supplier"));
    }

    public Supplier create(Supplier supplier) {
        return supplierRepository.save(supplier);
    }

    public void delete(Long id) {
        Optional<Supplier> obj = supplierRepository.findById(id);
        if(obj.isPresent()){
        supplierRepository.delete(id);
        }else{
            throw new ResourceNotFoundException(id,"Supplier");
        }
    }

    public Supplier update(Long id, Supplier supplier) {
        Optional<Supplier> optionalSupplier = supplierRepository.findById(id);
        if(optionalSupplier.isPresent()){
            Supplier entity = optionalSupplier.get();
            updateData(entity, supplier);
            return supplierRepository.save(entity);
        }else{
            throw new ResourceNotFoundException(id,"Supplier");
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
