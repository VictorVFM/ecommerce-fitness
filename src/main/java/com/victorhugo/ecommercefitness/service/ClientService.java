package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.repositories.ClientRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public List<Client> findAll() {
        return clientRepository.findByStatusTrue();
    }

    public Client findById(Long id) {
        Optional<Client> obj = clientRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id,"Client"));
    }


    public Client create(Client client) {
        return clientRepository.save(client);
    }

    public void delete(Long id) {
        Optional<Client> obj = clientRepository.findById(id);
        if (obj.isPresent()) {
            clientRepository.delete(id);
        } else {
            throw new ResourceNotFoundException(id,"Client");
        }
    }


    public Client update(Long id, Client client){
        Optional<Client> optionalClient = clientRepository.findById(id);
        if (optionalClient.isPresent()) {
            Client entity = optionalClient.get();
            updateData(entity, client);
            return clientRepository.save(entity);
        } else {
            throw new ResourceNotFoundException(id, "Client");
        }
    }

    public void updateData(Client entity, Client newEntity) {
        entity.setName(newEntity.getName());
        entity.setEmail(newEntity.getEmail());
        entity.setDocument(newEntity.getDocument());
        entity.setPhone(newEntity.getPhone());
        entity.setPassword(newEntity.getPassword());
        entity.setStatus(newEntity.getStatus());

    }



}
