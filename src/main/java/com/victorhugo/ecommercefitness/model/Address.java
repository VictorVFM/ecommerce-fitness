package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
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
    private String cep;

    @Column(name = "estado", nullable = false, length = 2)
    private String state;

    @Column(name = "cidade", nullable = false, length = 50)
    private String city;

    @Column(name = "bairro", nullable = false, length = 50)
    private String neighborhood;

    @Column(name = "logradouro", nullable = false, length = 50)
    private String street;

    @Column(name = "numero", length = 6)
    private String number;

    @Column(name = "id_Cliente", nullable = false)
    private Long id_Client;

}