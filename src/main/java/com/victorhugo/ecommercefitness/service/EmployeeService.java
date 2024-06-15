package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.repositories.EmployeeRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> findAll() {
        return employeeRepository.findByStatusTrue();
    }

    public Employee findById(Long id) {
        Optional<Employee> obj = employeeRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id,"Employee"));
    }

    public UserDetails findByUsername(String email){
        UserDetails obj = employeeRepository.findByEmail(email);
        return obj;
    }

    public Employee findByEmail(String email){
        Employee obj = employeeRepository.findByEmail(email);
        return obj;
    }
    public Employee create(Employee employee) {

        return employeeRepository.save(employee);
    }

    public void delete(Long id) {
        Optional<Employee> obj = employeeRepository.findById(id);
        if(obj.isPresent()){
        employeeRepository.delete(id);
        }else{
            throw  new ResourceNotFoundException(id,"Employee");
        }
    }

    public Employee update(Long id, Employee employee) {
        Optional<Employee> optionalEmployee = employeeRepository.findById(id);
        if(optionalEmployee.isPresent()){
            Employee entity = optionalEmployee.get();
            updateData(entity, employee);
            return employeeRepository.save(entity);
        }else {
            throw new ResourceNotFoundException(id,"Employee");
        }

    }

    private void updateData(Employee entity, Employee newEntity) {
        entity.setName(newEntity.getName());
        entity.setGender(newEntity.getGender());
        entity.setBirthDate(newEntity.getBirthDate());
        entity.setCpf(newEntity.getCpf());
        entity.setEmail(newEntity.getEmail());
        entity.setPhone(newEntity.getPhone());
        entity.setPassword(newEntity.getPassword());
        entity.setRole(newEntity.getRole());
        entity.setStatus(newEntity.isStatus());
    }
}
