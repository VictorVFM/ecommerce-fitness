package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.repositories.ClientRepository;
import com.victorhugo.ecommercefitness.repositories.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthorizationService implements UserDetailsService {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    ClientRepository clientRepository;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        UserDetails user = null;

        user = clientRepository.findByEmail(email);
        if(user == null){
            user = employeeRepository.findByEmail(email);
        }
        return user;
    }
}
