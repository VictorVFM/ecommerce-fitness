package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.PaymentType;
import com.victorhugo.ecommercefitness.repositories.PaymentTypeRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PaymentTypeService {
    @Autowired
    private PaymentTypeRepository paymentTypeRepository;

    public List<PaymentType> findAll() {
        return paymentTypeRepository.findByStatusTrue();
    }

    public PaymentType findById(Long id) {
        Optional<PaymentType> obj = paymentTypeRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id,"Payment Type"));
    }

    public PaymentType create(PaymentType paymentType) {

        return paymentTypeRepository.save(paymentType);
    }

    public void delete(Long id) {
        Optional<PaymentType> obj = paymentTypeRepository.findById(id);
        if(obj.isPresent()){
            paymentTypeRepository.delete(id);
        }else{
            throw  new ResourceNotFoundException(id,"Payment Type");
        }
    }

    public PaymentType update(Long id, PaymentType paymentType) {
        Optional<PaymentType> optionalPaymentType = paymentTypeRepository.findById(id);
        if(optionalPaymentType.isPresent()){
            PaymentType entity = optionalPaymentType.get();
            updateData(entity, paymentType);
            return paymentTypeRepository.save(entity);
        }else {
            throw new ResourceNotFoundException(id,"Payment type");
        }

    }

    private void updateData(PaymentType entity, PaymentType newEntity) {
        entity.setName(newEntity.getName());
        entity.setStatus(newEntity.isStatus());
    }
}
