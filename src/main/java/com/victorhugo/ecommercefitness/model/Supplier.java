package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Fornecedor")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome_fantasia", nullable = false, length = 60)
    private String businessName;

    @Column(name = "cnpj", nullable = false, length = 14, unique = true)
    private String cnpj;

    @Column(name = "email", nullable = false, length = 100, unique = true)
    private String email;

    @Column(name = "telefone", nullable = false, length = 11, unique = true)
    private String phone;

    @Column(name = "status", nullable = false)
    private Boolean status = true;


}
