package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Client;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ClientRepository extends JpaRepository<Client, Long> {
    @Transactional
    @Modifying
    @Query("UPDATE Client c SET c.status = false WHERE c.id = ?1")
    void deleteById(Long clientId);


    List<Client> findByStatusTrue();
}
