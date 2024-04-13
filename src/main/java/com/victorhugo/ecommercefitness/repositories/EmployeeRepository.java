package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Employee;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    @Transactional
    @Modifying
    @Query("UPDATE Employee c SET c.status = false WHERE c.id = ?1")
    void delete(Long clientId);
    List<Employee> findByStatusTrue();
}
