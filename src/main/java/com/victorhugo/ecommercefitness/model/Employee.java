package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.Date;


@Entity
@Table(name = "Funcionario")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 60)
    private String name;

    @Column(name = "sexo", nullable = false, length = 1)
    private char gender;

    @Column(name = "data_nascimento", nullable = false)
    private Date birthDate;

    @Column(name = "cpf", nullable = false, length = 11, unique = true)
    private String cpf;

    @Column(name = "email", nullable = false, length = 100, unique = true)
    private String email;

    @Column(name = "telefone", nullable = false, length = 11, unique = true)
    private String phone;

    @Column(name = "senha", nullable = false, length = 255)
    private String password;

    @Column(name = "funcao", nullable = false, length = 40)
    private String position;

    @Column(name = "status", nullable = false)
    private boolean status = true;
}
