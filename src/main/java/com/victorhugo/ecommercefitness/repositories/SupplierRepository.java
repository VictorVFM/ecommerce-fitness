package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.model.Supplier;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {

    @Transactional
    @Modifying
    @Query("UPDATE Supplier s SET s.status = false WHERE s.id = ?1")
    void delete(Long supplierId);
    List<Supplier> findByStatusTrue();
}
