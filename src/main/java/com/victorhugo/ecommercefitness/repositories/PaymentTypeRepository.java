package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.model.PaymentType;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PaymentTypeRepository extends JpaRepository<PaymentType,Long> {
    @Transactional
    @Modifying
    @Query("UPDATE PaymentType p SET p.status = false WHERE p.id = ?1")
    void delete(Long paymentTypeId);
    List<PaymentType> findByStatusTrue();
}
