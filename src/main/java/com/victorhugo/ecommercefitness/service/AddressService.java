package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Address;
import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.repositories.AddressRepository;
import com.victorhugo.ecommercefitness.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AddressService {

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private ClientRepository clientRepository;

    public Address create(Long clientId, Address address) {
        Optional<Client> optionalClient = clientRepository.findById(clientId);
        if (optionalClient.isPresent()) {
            Client user = optionalClient.get();
            address.setClient(user);
            return addressRepository.save(address);
        } else {
            throw new RuntimeException("User not found with ID: " + clientId);
        }
    }

    public List<Address> findAll() {
        return addressRepository.findAll();
    }

    public Optional<Address> findById(Long id) {
        return addressRepository.findById(id);
    }

    public void delete(Long id) {
        addressRepository.deleteById(id);
    }
}
