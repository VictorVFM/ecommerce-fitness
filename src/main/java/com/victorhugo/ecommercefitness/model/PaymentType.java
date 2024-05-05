package com.victorhugo.ecommercefitness.model;

import com.victorhugo.ecommercefitness.enums.Employee.EmployeeGender;
import com.victorhugo.ecommercefitness.enums.Employee.EmployeePosition;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Table(name = "tipo_pagamento")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class PaymentType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nome", nullable = false, length = 60)
    private String name;
    @Column(name = "status", nullable = false)
    private boolean status = true;

}
