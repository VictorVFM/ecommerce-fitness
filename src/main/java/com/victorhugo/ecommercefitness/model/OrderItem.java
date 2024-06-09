package com.victorhugo.ecommercefitness.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "itens_pedido")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_Pedido")
    @JsonBackReference
    private Order order;

    @ManyToOne
    @JoinColumn(name = "id_Comida")
    private Food food;

    @Column(name = "quantidade", nullable = false)
    private int quantity;


}
