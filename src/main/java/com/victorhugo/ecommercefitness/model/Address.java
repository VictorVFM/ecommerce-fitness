package com.victorhugo.ecommercefitness.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Endereco")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "cep", length = 8)
    private String zipCode;

    @Column(name = "estado", nullable = false, length = 2)
    private String state;

    @Column(name = "cidade", nullable = false, length = 50)
    private String city;

    @Column(name = "bairro", nullable = false, length = 50)
    private String neighborhood;

    @Column(name = "rua", nullable = false, length = 50)
    private String street;

    @Column(name = "numero", length = 6)
    private String number;

    @ManyToOne
    @JoinColumn(name = "id_Cliente")
    @JsonIgnore
    private Client client;



}