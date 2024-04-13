package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Address;
import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.repositories.AddressRepository;
import com.victorhugo.ecommercefitness.repositories.ClientRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
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



    public List<Address> findAll() {
        return addressRepository.findByStatusTrue();
    }

    public List<Address> findByClient(Long id) {
        return addressRepository.findByClientIdAndStatusTrue(id);
    }
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

    public void delete(Long id) {
        Optional<Address> obj = addressRepository.findById(id);
        if (obj.isPresent()) {
            addressRepository.delete(obj.get());
        } else {
            throw new ResourceNotFoundException(id,"Address");
        }
    }

    public Address update(Long id, Address address){
        Optional<Address> optionalAddress = addressRepository.findById(id);
        if (optionalAddress.isPresent()) {
            Address entity = optionalAddress.get();
            updateData(entity, address);
            return addressRepository.save(entity);
        } else {
            throw new ResourceNotFoundException(id, "Address");
        }
    }


    public void updateData(Address entity, Address newEntity) {
        entity.setZipCode(newEntity.getZipCode());
        entity.setState(newEntity.getState());
        entity.setCity(newEntity.getCity());
        entity.setNeighborhood(newEntity.getNeighborhood());
        entity.setStreet(newEntity.getStreet());
        entity.setNumber(newEntity.getNumber());
    }

}


