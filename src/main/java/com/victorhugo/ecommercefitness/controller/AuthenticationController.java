package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.dto.AuthenticationDTO;
import com.victorhugo.ecommercefitness.dto.LoginResponseDTO;
import com.victorhugo.ecommercefitness.dto.RegisterAdminDTO;
import com.victorhugo.ecommercefitness.infra.security.TokenService;
import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.repositories.EmployeeRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("auth")
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private TokenService tokenService;

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody @Valid AuthenticationDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(),data.password());
        var auth = this.authenticationManager.authenticate((usernamePassword));

        var token = this.tokenService.generateToken((Employee) auth.getPrincipal());

        return  ResponseEntity.ok(new LoginResponseDTO(token));
    }


    @PostMapping("/register")
    public ResponseEntity register (@RequestBody @Valid RegisterAdminDTO data){
        if(this.employeeRepository.findByEmail(data.email()) != null) return ResponseEntity.badRequest().build();

        String encryptedPassword = new BCryptPasswordEncoder().encode(data.password());
        Employee newEmployee = new Employee(data.name(),data.gender(),data.birthDate(),
                                            data.cpf(),data.email(),data.phone(),
                                            encryptedPassword,data.role()
        );

        this.employeeRepository.save(newEmployee);

        return ResponseEntity.ok().build();
    }
}
