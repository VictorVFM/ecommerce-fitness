package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Client;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
    @Transactional
    @Modifying
    @Query("UPDATE Client c SET c.status = false WHERE c.id = ?1")
    void delete(Long clientId);
    List<Client> findByStatusTrue();
    UserDetails findByEmail(String email);
}
