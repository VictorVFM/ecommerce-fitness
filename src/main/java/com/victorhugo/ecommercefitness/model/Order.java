package com.victorhugo.ecommercefitness.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.victorhugo.ecommercefitness.enums.Employee.OrderStage;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
    @JsonFormat(pattern = "dd/MM/yyyy", locale = "pt-BR", timezone = "America/Sao_Paulo")
    private Date orderDate = new Date();

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST})
    @JsonManagedReference
    private List<OrderItem> orderItems = new ArrayList<OrderItem>();

    @Transient
    private Double total_price = 0.0;

    @Transient
    private int total_kcal = 0;

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

    @PostLoad
    private void totalPrice() {
        BigDecimal totalPrice = BigDecimal.ZERO;
        BigDecimal totalKcal = BigDecimal.ZERO;
        for (OrderItem item : this.orderItems) {
            BigDecimal itemPrice = BigDecimal.valueOf(item.getFood().getPrice() * item.getQuantity());
            this.total_kcal += item.getFood().getKcal() * item.getQuantity();
            totalPrice = totalPrice.add(itemPrice);


        }
        this.total_price = totalPrice.setScale(2, RoundingMode.HALF_UP).doubleValue();

    }








}
