package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.enums.Employee.EmployeeRole;
import com.victorhugo.ecommercefitness.model.Ingredient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/role-employees")
public class RoleEmployeeController {

    @GetMapping
    public ResponseEntity<List<EmployeeRole>> findAll(){
        List<EmployeeRole> roles = Arrays.asList(EmployeeRole.values());
        return ResponseEntity.ok(roles);
    }
}
