package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Food;
import com.victorhugo.ecommercefitness.model.Order;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Long> {

    @Transactional
    @Modifying
    @Query("UPDATE Order o SET o.status = false WHERE o.id = ?1")
    void delete(Long orderId);

    List<Order> findByStatusTrue();
}
