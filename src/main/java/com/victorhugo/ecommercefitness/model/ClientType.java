package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tipo_cliente")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class ClientType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 100)
    private String name;

    @Column(name = "status", nullable = false)
    private Boolean status = true;


}
