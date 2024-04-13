package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public ResponseEntity<List<Employee>> findAll() {
        List<Employee> employees = employeeService.findAll();
        return ResponseEntity.ok(employees);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Employee> findById(@PathVariable Long id) {
        Employee employee = employeeService.findById(id);
        return ResponseEntity.ok().body(employee);
    }

    @PostMapping
    public ResponseEntity<Employee> create(@RequestBody Employee employee) {
        employee = employeeService.create(employee);
        return ResponseEntity.status(HttpStatus.CREATED).body(employee);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Employee> update(@PathVariable Long id, @RequestBody Employee employee) {
        employee = employeeService.update(id, employee);
        return ResponseEntity.ok().body(employee);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        employeeService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
