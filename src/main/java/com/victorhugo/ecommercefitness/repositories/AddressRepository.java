package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Address;
import com.victorhugo.ecommercefitness.model.Client;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Long> {

    @Transactional
    @Modifying
    @Query("UPDATE Address a SET a.status = false WHERE a.id = ?1")
    void delete(Long addressId);

    List<Address> findByClientIdAndStatusTrue(Long id);

    List<Address> findByStatusTrue();
}
