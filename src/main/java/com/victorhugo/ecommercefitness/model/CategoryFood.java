package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Categoria_comida")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class CategoryFood {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 50)
    private String name;

    @Column(name = "status", nullable = false)
    private Boolean status = true;
}
