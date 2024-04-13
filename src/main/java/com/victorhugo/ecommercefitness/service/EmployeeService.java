package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.repositories.EmployeeRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
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
        return obj.orElseThrow(() -> new RuntimeException("Employee not found"));
    }

    public Employee create(Employee employee) {

        return employeeRepository.save(employee);
    }

    public void delete(Long id) {
        employeeRepository.delete(id);
    }

    public Employee update(Long id, Employee employee) {
        try {
            Employee entity = employeeRepository.getOne(id);
            updateData(entity, employee);
            return employeeRepository.save(entity);
        } catch (EntityNotFoundException e) {
            throw new RuntimeException("Employee not found with ID: " + id);
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
        entity.setPosition(newEntity.getPosition());
        entity.setStatus(newEntity.isStatus());
    }
}
