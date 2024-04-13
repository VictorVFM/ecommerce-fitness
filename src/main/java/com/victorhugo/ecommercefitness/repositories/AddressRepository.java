package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Address;
import com.victorhugo.ecommercefitness.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Long> {

    List<Address> findByClientId(Long id);}
