package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.dto.AuthenticationDTO;
import com.victorhugo.ecommercefitness.dto.LoginResponseDTO;
import com.victorhugo.ecommercefitness.dto.RegisterAdminDTO;
import com.victorhugo.ecommercefitness.infra.security.TokenService;
import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.repositories.EmployeeRepository;
import com.victorhugo.ecommercefitness.service.EmployeeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private TokenService tokenService;

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
        employee.setPassword(new BCryptPasswordEncoder().encode(employee.getPassword()));
        employee = employeeService.update(id, employee);
        return ResponseEntity.ok().body(employee);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        employeeService.delete(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<Employee> findByEmail(@PathVariable String email) {
        Employee client = employeeService.findByEmail(email);
        return ResponseEntity.ok().body(client);
    }

    @PostMapping("/auth/login")
    public ResponseEntity login(@RequestBody @Valid AuthenticationDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(),data.password());
        var auth = this.authenticationManager.authenticate((usernamePassword));

        var token = this.tokenService.generateToken((Employee) auth.getPrincipal());

        return  ResponseEntity.ok(new LoginResponseDTO(token,data.email()));
    }

    @PostMapping("/auth/register")
    public ResponseEntity register (@RequestBody @Valid RegisterAdminDTO data){

        String encryptedPassword = new BCryptPasswordEncoder().encode(data.password());
        Employee newEmployee = new Employee(data.name(),data.gender(),data.birthDate(),
                data.cpf(),data.email(),data.phone(),
                encryptedPassword,data.role()
        );
        this.employeeService.create(newEmployee);
        return ResponseEntity.ok().build();
    }
}
