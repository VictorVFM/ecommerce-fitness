package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Ingrediente")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Ingredient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 50)
    private String name;

    @Column(name = "id_fornecedor", nullable = false)
    private Long id_Supplier;

    @Column(name = "quantidade", nullable = false)
    private int quantity;

    @Column(name = "status", nullable = false)
    private Boolean status = true;

}
