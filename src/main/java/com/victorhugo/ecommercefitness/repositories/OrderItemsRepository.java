package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemsRepository extends JpaRepository<OrderItem,Long> {
}
