package com.victorhugo.ecommercefitness.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.victorhugo.ecommercefitness.enums.Employee.OrderStage;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Pedido")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_Cliente")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "id_Funcionario")
    private Employee employee;

    @Column(name = "data_pedido", nullable = false, length = 50)
    private Date orderDate = new Date();

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST})
    @JsonManagedReference
    private List<OrderItem> orderItems = new ArrayList<OrderItem>();

    @ManyToOne
    @JoinColumn(name = "id_tipo_pagamento")
    private PaymentType paymentType;

    @Column(name = "endereco", nullable = false, length = 50)
    private String address;

    @Column(name = "etapa", nullable = false, length = 40)
    @Enumerated(EnumType.STRING)
    private OrderStage orderStage = OrderStage.NOVO;

    @Column(name = "status")
    private Boolean status = true;




}
